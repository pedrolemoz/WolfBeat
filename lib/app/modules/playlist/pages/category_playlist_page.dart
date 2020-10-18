import 'package:WolfBeat/core/view_model/user/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/models/playlist/playlist.dart';
import '../../../../core/view_model/player/player_view_model.dart';
import '../../player/pages/player_page.dart';
import '../../ui_components/music_tile.dart';

class CategoryPlaylistPage extends StatelessWidget {
  static const String id = 'category_playlist_page';

  final Playlist playlist;

  CategoryPlaylistPage({@required this.playlist});

  @override
  Widget build(BuildContext context) {
    var _playerViewModel = GetIt.I.get<PlayerViewModel>();
    var _userViewModel = GetIt.I.get<UserViewModel>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          playlist.playlistName,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _playerViewModel.playRandomlyFromPlaylist(playlist);

          Navigator.pushNamed(context, PlayerPage.id);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          FlutterIcons.shuffle_mco,
          color: Color(0xFFF0F0F5),
          size: 30.0,
        ),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: playlist.songs.length,
          padding: EdgeInsets.symmetric(vertical: 13.0),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return MusicTile(
              onTap: () {
                _playerViewModel.playSongFromPlaylist(
                  playlist: playlist,
                  song: playlist.songs.elementAt(index),
                );

                Navigator.pushNamed(context, PlayerPage.id);
              },
              song: playlist.songs.elementAt(index),
            );
          },
        );
      }),
    );
  }
}
