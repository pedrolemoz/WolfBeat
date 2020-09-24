import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../favorite_songs/pages/favorite_songs_page.dart';

/// [FavoriteSongsCard] redirects the user to [FavoriteSongsPage].
/// It's a Container with a music cover inside.
/// Used in [HomePage].
class FavoriteSongsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, FavoriteSongsPage.id),
        borderRadius: BorderRadius.circular(10.0),
        splashColor: Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          height: 60.0,
          decoration: BoxDecoration(
            // color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Icon(
                      FlutterIcons.heart_mco,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Text(
                'Favoritas',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
