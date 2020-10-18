import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../core/view_model/user/user_view_model.dart';
import '../../../../playlist/pages/create_new_playlist_page.dart';
import '../../../../ui_components/favorite_songs_tile.dart';
import '../../../../ui_components/playlist_tile.dart';

class PlaylistsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userViewModel = GetIt.I.get<UserViewModel>();

    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 13.0),
      children: [
        Observer(builder: (_) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: _userViewModel.playlists.length + 1,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return FavoriteSongsTile();
                default:
                  return PlaylistTile(
                    playlist: _userViewModel.playlists[index - 1],
                  );
              }
            },
          );
        }),
        Theme(
          data: Theme.of(context).copyWith(
            splashColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: ListTile(
            onTap: () => Navigator.pushNamed(context, CreateNewPlaylistPage.id),
            title: Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, top: 10.0, bottom: 10.0),
              child: Text('Criar nova playlist'),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 13.0),
              child: Icon(FlutterIcons.add_mdi, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
