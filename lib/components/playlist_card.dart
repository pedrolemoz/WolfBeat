import 'package:flutter/material.dart';

/// [PlaylistCard] is a widget that redirects the user to ***.
/// It's a Container with a music cover inside.
/// Used in [HomePage].
class PlaylistCard extends StatelessWidget {
  PlaylistCard({@required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
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
                  child: Image.network(
                    'https://images-na.ssl-images-amazon.com/images/I/815aiIN6wmL.jpg',
                  ),
                ),
              ),
            ),
            Text(
              'Playlist $index',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
