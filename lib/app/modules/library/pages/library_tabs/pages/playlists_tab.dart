import 'package:flutter/material.dart';

import '../../../../ui_components/favorite_songs_tile.dart';
import '../../../../ui_components/playlist_tile.dart';

class PlaylistsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 150,
      padding: EdgeInsets.symmetric(vertical: 13.0),
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return FavoriteSongsTile();
          default:
            return PlaylistTile(index: index - 1);
        }
      },
    );
  }
}
