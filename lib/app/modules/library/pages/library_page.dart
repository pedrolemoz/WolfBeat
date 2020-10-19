import 'package:WolfBeat/app/modules/ui_components/mini_player.dart';
import 'package:WolfBeat/core/view_model/player/player_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'library_tabs/pages/albums_tab.dart';
import 'library_tabs/pages/artists_tab.dart';
import 'library_tabs/pages/playlists_tab.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Biblioteca de músicas',
          style: Theme.of(context).textTheme.headline6,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
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
      ),
      body: TabBarView(
        controller: _libraryTabController,
        children: [
          PlaylistsTab(),
          ArtistsTab(),
          AlbumsTab(),
        ],
      ),
    );
  }
}
