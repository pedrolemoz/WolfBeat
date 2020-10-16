import 'package:WolfBeat/core/view_model/user/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../ui_components/favorite_songs_tile.dart';
import '../../../../ui_components/playlist_tile.dart';

class PlaylistsTab extends StatelessWidget {
  final playlists = GetIt.I.get<UserViewModel>().playlists;

  @override
  Widget build(BuildContext context) {
    print(playlists.length);
    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: playlists.length + 1,
        padding: EdgeInsets.symmetric(vertical: 13.0),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return FavoriteSongsTile();
            default:
              return PlaylistTile(playlist: playlists[index - 1]);
          }
        },
      );
    });
  }
}
