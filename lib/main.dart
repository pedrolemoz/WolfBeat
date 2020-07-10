import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'pages/bottom_navigation/bottom_navigation_bar.dart';
import 'pages/home/home_page.dart';
import 'pages/library/library_page.dart';
import 'pages/favorite_songs/favorite_songs_page.dart';
import 'pages/player/player_page.dart';
import 'pages/settings/settings_page.dart';
import 'utils/themes.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.windows;
  runApp(Firefly());
}

class Firefly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: textTheme,
        primaryColor: Colors.red[900],
        accentColor: Color(0xFF99AAB5),
        scaffoldBackgroundColor: Color(0xFF23272A),
        backgroundColor: Color(0xFF2c2f33),
        accentColorBrightness: Brightness.dark,
        appBarTheme: appBarTheme,
        tabBarTheme: tabBarTheme,
      ),
      initialRoute: BottomNavigation.id,
      routes: {
        BottomNavigation.id: (context) => BottomNavigation(),
        LibraryPage.id: (context) => LibraryPage(),
        PlayerPage.id: (context) => PlayerPage(),
        FavoriteSongsPage.id: (context) => FavoriteSongsPage(),
        HomePage.id: (context) => HomePage(),
        SettingsPage.id: (context) => SettingsPage(),
      },
    );
  }
}
