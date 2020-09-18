import 'package:flutter/material.dart';

import '../favorite_songs/pages/favorite_songs_page.dart';

/// [FavoriteSongsCard] redirects the user to [FavoriteSongsPage].
/// It's a Container with a music cover inside.
/// Used in [HomePage].
class FavoriteSongsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, FavoriteSongsPage.id),
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
              'Favoritas',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
