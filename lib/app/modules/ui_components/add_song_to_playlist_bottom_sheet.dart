import 'package:WolfBeat/core/view_model/song/songs_view_model.dart';
import 'package:WolfBeat/core/view_model/user/user_view_model.dart';
import 'package:flutter/material.dart';

import 'music_tile.dart';

class AddSongsToPlaylistBottomSheet extends StatelessWidget {
  const AddSongsToPlaylistBottomSheet({
    Key key,
    @required SongsViewModel songsViewModel,
    @required UserViewModel userViewModel,
    @required this.playlistIndex,
    @required GlobalKey<ScaffoldState> scaffoldGlobalKey,
  })  : _songsViewModel = songsViewModel,
        _userViewModel = userViewModel,
        _scaffoldGlobalKey = scaffoldGlobalKey,
        super(key: key);

  final SongsViewModel _songsViewModel;
  final UserViewModel _userViewModel;
  final int playlistIndex;
  final GlobalKey<ScaffoldState> _scaffoldGlobalKey;

  @override
  Widget build(BuildContext context) {
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

                _scaffoldGlobalKey.currentState.showSnackBar(
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
