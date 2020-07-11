import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../components/favorite_songs_card.dart';
import '../../components/playlist_card.dart';
import '../../pages/settings/settings_page.dart';

class HomePage extends StatelessWidget {
  static const String id = 'home_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Firefly 🔥',
                  style: Theme.of(context).textTheme.headline6,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SettingsPage.id);
                  },
                  child: Icon(
                    FlutterIcons.settings_sli,
                    size: 20.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            // Deve retornar as 3 primeiras playlists (Favoritas + 3 playlists)
            child: GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 3.0,
              ),
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return FavoriteSongsCard();
                  default:
                    return PlaylistCard(index: index);
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Tocadas recentemente',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 200.0,
              ),
              child: ListView.builder(
                // Deve retornar as 5 músicas escutadas recentemente
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              'https://images-na.ssl-images-amazon.com/images/I/815aiIN6wmL.jpg',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Playlist ${index + 1}',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Recomendado para você',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: 200.0,
              ),
              child: ListView.builder(
                // Retornar 5 músicas escolhidas aleatoriamente
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              'https://images-na.ssl-images-amazon.com/images/I/815aiIN6wmL.jpg',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Playlist ${index + 1}',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
