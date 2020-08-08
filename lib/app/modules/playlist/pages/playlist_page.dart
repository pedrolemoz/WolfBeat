import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/view_model/song/songs_view_model.dart';
import '../../ui_components/music_tile.dart';

class PlaylistPage extends StatefulWidget {
  static const String id = 'playlist_page';

  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  final songsViewModel = GetIt.I.get<SongsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Playlist top',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                FlutterIcons.sort_variant_mco,
                color: Color(0xFFF0F0F5),
                size: 30.0,
              ),
            ),
          ),
        ],
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
          itemCount: songsViewModel.songs.length,
          padding: EdgeInsets.symmetric(vertical: 13.0),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return MusicTile(
              song: songsViewModel.songs[index],
              // image: Image.network(
              //   'https://images-na.ssl-images-amazon.com/images/I/815aiIN6wmL.jpg',
              // ),
            );
          },
        );
      }),
    );
  }
}
