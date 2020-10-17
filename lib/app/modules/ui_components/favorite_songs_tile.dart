import 'package:WolfBeat/core/view_model/song/songs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get_it/get_it.dart';

import '../../../core/view_model/player/player_view_model.dart';
import '../favorite_songs/pages/favorite_songs_page.dart';

/// [FavoriteSonsTile] redirects the user to [FavoriteSongsPage].
/// It's a Container with a disc icon inside.
/// Used in [PlaylistsTab].
class FavoriteSongsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final songsViewModel = GetIt.I.get<SongsViewModel>();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, FavoriteSongsPage.id);
        },
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Theme.of(context).primaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(13.0),
              child: Icon(
                FlutterIcons.disc_mco,
                color: Colors.white,
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Suas músicas curtidas',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                '${songsViewModel.songs.length} músicas',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
