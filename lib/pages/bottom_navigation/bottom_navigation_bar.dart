import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../pages/home/home_page.dart';
import '../../pages/library/library_page.dart';
import '../../pages/search/search_page.dart';

class BottomNavigation extends StatefulWidget {
  static final String id = 'bottom_navigator';

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> tabs = [
    HomePage(),
    SearchPage(),
    LibraryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF2c2f33),
        elevation: 0.0,
        selectedItemColor: Color(0xFFF0F0F5),
        selectedLabelStyle: TextStyle(
          fontFamily: 'SourceSansPro',
          color: Color(0xFFF0F0F5),
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        unselectedItemColor: Color(0xFF757575),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'SourceSansPro',
          color: Color(0xFFF0F0F5),
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        iconSize: 25.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FlutterIcons.home_mdi),
            title: Text('Página inicial'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FlutterIcons.search_mdi),
            title: Text('Buscar'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FlutterIcons.library_music_outline_mco),
            title: Text('Biblioteca'),
          ),
        ],
      ),
    );
  }
}
