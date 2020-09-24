import 'package:flutter/material.dart';

import '../../../core/helpers/assets_helper.dart';

/// [PlaylistTile] is a widget that redirects the user to ***.
/// It's a Container with the first 4 music cover of the playlist inside.
/// Used in [PlaylistsTab].

class PlaylistTile extends StatelessWidget {
  PlaylistTile({this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            width: 50.0,
            child: GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
              ),
              itemBuilder: (context, _) {
                return Image.asset(AssetsHelper.artworkFallback);
              },
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Playlist ${index + 1}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              '${(index + 42) * 100} músicas',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
