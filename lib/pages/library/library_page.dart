import 'package:flutter/material.dart';

import 'tabs/albums_tab.dart';
import 'tabs/artists_tab.dart';
import 'tabs/playlists_tab.dart';

class LibraryPage extends StatefulWidget {
  static const String id = 'library_page';
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with SingleTickerProviderStateMixin {
  TabController _libraryTabController;

  @override
  void initState() {
    super.initState();
    _libraryTabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Implementar App e Tab Bar roláveis
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Biblioteca de músicas',
            style: Theme.of(context).textTheme.headline6,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: TabBar(
                controller: _libraryTabController,
                indicatorColor: Theme.of(context).primaryColor,
                labelPadding: EdgeInsets.all(15.0),
                labelColor: Color(0xFFF0F0F5),
                unselectedLabelColor: Color(0xFFe0e0e0),
                unselectedLabelStyle: Theme.of(context).textTheme.subtitle1,
                labelStyle: Theme.of(context).textTheme.subtitle1,
                isScrollable: true,
                tabs: [
                  Text('Playlists'),
                  Text('Artistas'),
                  Text('Álbuns'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _libraryTabController,
          children: [
            PlaylistsTab(),
            ArtistsTab(),
            AlbumsTab(),
          ],
        ),
      ),
    );
  }
}
