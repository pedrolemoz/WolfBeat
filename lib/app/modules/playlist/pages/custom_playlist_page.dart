import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/view_model/player/player_view_model.dart';
import '../../../../core/view_model/song/songs_view_model.dart';
import '../../../../core/view_model/user/user_view_model.dart';
import '../../player/pages/player_page.dart';
import '../../ui_components/add_song_to_playlist_bottom_sheet.dart';
import '../../ui_components/music_tile.dart';

class CustomPlaylistPage extends StatelessWidget {
  static const String id = 'playlist_page';
  final int playlistIndex;

  CustomPlaylistPage({@required this.playlistIndex});

  final _playerViewModel = GetIt.I.get<PlayerViewModel>();
  final _songsViewModel = GetIt.I.get<SongsViewModel>();
  final _userViewModel = GetIt.I.get<UserViewModel>();

  @override
  Widget build(BuildContext context) {
    final _scaffoldGlobalKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldGlobalKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _playerViewModel.playRandomlyFromPlaylist(
            _userViewModel.playlists.elementAt(playlistIndex),
          );
          Navigator.pushNamed(context, PlayerPage.id);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          FlutterIcons.shuffle_mco,
          color: Color(0xFFF0F0F5),
          size: 30.0,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _userViewModel.playlists.elementAt(playlistIndex).playlistName,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                builder: (context) {
                  return AddSongsToPlaylistBottomSheet(
                    songsViewModel: _songsViewModel,
                    userViewModel: _userViewModel,
                    playlistIndex: playlistIndex,
                    scaffoldGlobalKey: _scaffoldGlobalKey,
                  );
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                FlutterIcons.add_mdi,
                color: Color(0xFFF0F0F5),
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
      body: Observer(builder: (_) {
        if (_userViewModel.playlists.elementAt(playlistIndex).songs.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Essa playlist está vazia!',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 15.0),
                Text(
                  'Novas músicas aparecerão quando você adicionar',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount:
              _userViewModel.playlists.elementAt(playlistIndex).songs.length,
          padding: EdgeInsets.symmetric(vertical: 13.0),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return MusicTile(
              onTap: () {
                _playerViewModel.playSongFromPlaylist(
                  playlist: _userViewModel.playlists.elementAt(playlistIndex),
                  song: _userViewModel.playlists
                      .elementAt(playlistIndex)
                      .songs
                      .elementAt(index),
                );

                Navigator.pushNamed(context, PlayerPage.id);
              },
              song: _userViewModel.playlists
                  .elementAt(playlistIndex)
                  .songs
                  .elementAt(index),
              playlistName: _userViewModel.playlists
                  .elementAt(playlistIndex)
                  .playlistName,
              onDelete: () {
                _userViewModel.removeSongFromPlaylist(
                  playlist: _userViewModel.playlists.elementAt(playlistIndex),
                  song: _userViewModel.playlists
                      .elementAt(playlistIndex)
                      .songs
                      .elementAt(index),
                );

                Navigator.maybePop(context);

                _scaffoldGlobalKey.currentState.showSnackBar(
                  SnackBar(
                    content: Text(
                      'Música removida da playlist "${_userViewModel.playlists.elementAt(playlistIndex).playlistName}"',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}
