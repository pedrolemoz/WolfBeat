import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/models/playlist/playlist.dart';
import '../../../../core/view_model/user/user_view_model.dart';
import '../../ui_components/rounded_button.dart';
import '../../ui_components/rounded_text_field.dart';
import 'custom_playlist_page.dart';

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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomPlaylistPage(
                          playlistIndex: index,
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
