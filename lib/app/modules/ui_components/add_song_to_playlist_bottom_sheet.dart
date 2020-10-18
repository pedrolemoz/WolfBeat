import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../core/view_model/song/songs_view_model.dart';
import '../../../core/view_model/user/user_view_model.dart';
import 'music_tile.dart';

class AddSongsToPlaylistBottomSheet extends StatelessWidget {
  const AddSongsToPlaylistBottomSheet({
    @required this.playlistIndex,
    @required this.scaffoldGlobalKey,
  });

  final int playlistIndex;
  final GlobalKey<ScaffoldState> scaffoldGlobalKey;

  @override
  Widget build(BuildContext context) {
    final _songsViewModel = GetIt.I.get<SongsViewModel>();
    final _userViewModel = GetIt.I.get<UserViewModel>();

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      children: [
        Center(
          child: Text(
            'Escolha uma música para adicionar',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(height: 15.0),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _songsViewModel.songs.length,
          itemBuilder: (context, index) {
            return MusicTile(
              playlistName: _userViewModel.playlists
                  .elementAt(playlistIndex)
                  .playlistName,
              song: _songsViewModel.songs[index],
              onTap: () {
                _userViewModel.addSongToPlaylist(
                  playlist: _userViewModel.playlists.elementAt(playlistIndex),
                  song: _songsViewModel.songs[index],
                );

                Navigator.maybePop(context);

                scaffoldGlobalKey.currentState.showSnackBar(
                  SnackBar(
                    content: Text(
                      'Música adicionada à playlist "${_userViewModel.playlists.elementAt(playlistIndex).playlistName}"',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
