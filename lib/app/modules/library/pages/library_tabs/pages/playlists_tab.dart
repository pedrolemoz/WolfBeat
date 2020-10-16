import 'package:WolfBeat/app/modules/playlist/pages/playlist_page.dart';
import 'package:WolfBeat/app/modules/ui_components/music_tile.dart';
import 'package:WolfBeat/app/modules/ui_components/rounded_button.dart';
import 'package:WolfBeat/app/modules/ui_components/rounded_text_field.dart';
import 'package:WolfBeat/core/helpers/firebase_helper.dart';
import 'package:WolfBeat/core/models/playlist/playlist.dart';
import 'package:WolfBeat/core/models/song/song.dart';
import 'package:WolfBeat/core/view_model/user/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../ui_components/favorite_songs_tile.dart';
import '../../../../ui_components/playlist_tile.dart';

class PlaylistsTab extends StatelessWidget {
  final _userViewModel = GetIt.I.get<UserViewModel>();

  @override
  Widget build(BuildContext context) {
    print(_userViewModel.playlists.length);
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
                      playlist: _userViewModel.playlists[index - 1]);
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

class CreateNewPlaylistPage extends StatelessWidget {
  static const String id = 'create_new_playlist_page';

  final _userViewModel = GetIt.I.get<UserViewModel>();

  @override
  Widget build(BuildContext context) {
    final _playlistNameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Criar nova playlist',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        children: [
          SizedBox(height: 150.0),
          Column(
            children: [
              Text(
                'Qual o nome da sua playlist?',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 20.0),
              RoundedTextField(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                textController: _playlistNameController,
                hintText: 'Insira o nome da playlist',
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                onSubmitted: () {
                  _userViewModel.createNewPlaylist(
                    newPlaylist: Playlist(
                      playlistName: _playlistNameController.text,
                      songs: [],
                    ),
                  );
                },
              ),
              SizedBox(height: 20.0),
              RoundedButton(
                onTap: () {
                  _userViewModel
                      .createNewPlaylist(
                    newPlaylist: Playlist(
                      playlistName: _playlistNameController.text,
                      songs: [],
                    ),
                  )
                      .then((index) {
                    var musicTiles = <MusicTile>[];

                    _userViewModel.playlists[index].songs.forEach(
                      (playlistSong) async {
                        final _playlistSong = playlistSong as DocumentReference;
                        final song = await _playlistSong.get();

                        musicTiles.add(
                          MusicTile(
                            playlistName:
                                _userViewModel.playlists[index].playlistName,
                            song: Song(
                              title: song.data[FirebaseHelper.titleAttribute],
                              songURL:
                                  song.data[FirebaseHelper.songURLAttribute],
                              album: song.data[FirebaseHelper.albumAttribute],
                              artist: song.data[FirebaseHelper.artistAttribute],
                              artworkURL:
                                  song.data[FirebaseHelper.artworkURLAttribute],
                              duration:
                                  song.data[FirebaseHelper.durationAttribute],
                              genre: song.data[FirebaseHelper.genreAttribute],
                              backgroundColor: song.data[
                                  FirebaseHelper.backgroundColorAttribute],
                              reference: song.reference,
                            ),
                          ),
                        );
                      },
                    );

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlaylistPage(
                          songs: musicTiles,
                          playlistTitle:
                              _userViewModel.playlists[index].playlistName,
                        ),
                      ),
                    );
                  });
                },
                label: 'Criar nova playlist',
                enabledColor: Theme.of(context).primaryColor,
                isEnabled: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
