import 'package:flutter/material.dart';

import '../../../core/helpers/assets_helper.dart';
import '../../../core/models/playlist/playlist.dart';

/// [PlaylistCard] redirects the user to ***.
/// It's a Container with a music cover inside.
/// Used in [HomePage].
class PlaylistCard extends StatelessWidget {
  PlaylistCard({this.playlist});

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        onTap: () {
          print('pressed');
        },
        borderRadius: BorderRadius.circular(10.0),
        splashColor: Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          height: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(AssetsHelper.artworkFallback),
                  ),
                ),
              ),
              Text(
                playlist.playlistName,
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
