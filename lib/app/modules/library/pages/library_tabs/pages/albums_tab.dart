import 'package:flutter/material.dart';

class AlbumsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 15,
      shrinkWrap: true,
      padding: EdgeInsets.all(15.0),
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://images-na.ssl-images-amazon.com/images/I/815aiIN6wmL.jpg',
              ),
            ),
            Text(
              'Scary Monsters & Nice Sprites',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        );
      },
    );
  }
}
