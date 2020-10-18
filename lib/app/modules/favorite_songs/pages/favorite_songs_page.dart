import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/view_model/song/songs_view_model.dart';
import '../../ui_components/music_tile.dart';

class FavoriteSongsPage extends StatelessWidget {
  static const String id = 'favorite_songs_page';

  @override
  Widget build(BuildContext context) {
    final _songsViewModel = GetIt.I.get<SongsViewModel>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Suas Músicas',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          FlutterIcons.shuffle_mco,
          color: Color(0xFFF0F0F5),
          size: 30.0,
        ),
      ),
      body: Observer(builder: (_) {
        return ListView.builder(
          itemCount: _songsViewModel.songs.length,
          padding: EdgeInsets.symmetric(vertical: 13.0),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return MusicTile(
              playlistName: 'músicas favoritas',
              song: _songsViewModel.songs[index],
            );
          },
        );
      }),
    );
  }
}
