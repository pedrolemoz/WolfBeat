import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../components/music_tile.dart';

class FavoriteSongsPage extends StatefulWidget {
  static const String id = 'favorite_songs_page';
  @override
  _FavoriteSongsPageState createState() => _FavoriteSongsPageState();
}

class _FavoriteSongsPageState extends State<FavoriteSongsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Suas Músicas',
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
      body: ListView.builder(
        itemCount: 15,
        padding: EdgeInsets.symmetric(vertical: 13.0),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return MusicTile(
            index: index,
            image: Image.network(
              'https://images-na.ssl-images-amazon.com/images/I/815aiIN6wmL.jpg',
            ),
          );
        },
      ),
    );
  }
}
