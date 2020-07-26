import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/auth/sign_in/sign_in_controller.dart';
import 'controllers/auth/sign_up/sign_up_controller.dart';
import 'controllers/player/player_controller.dart';
import 'controllers/songs/songs_controller.dart';
import 'controllers/user/user_controller.dart';

import 'pages/auth/auth_with_google_page.dart';
import 'pages/auth/sign_in/sign_in_page.dart';
import 'pages/auth/sign_in/sign_in_with_email_and_password_page.dart';
import 'pages/auth/sign_up/sign_up_page.dart';
import 'pages/auth/sign_up/sign_up_with_email_and_password_page.dart';
import 'pages/auth/welcome_page.dart';
import 'pages/bottom_navigation/bottom_navigation_bar.dart';
import 'pages/favorite_songs/favorite_songs_page.dart';
import 'pages/home/home_page.dart';
import 'pages/library/library_page.dart';
import 'pages/player/player_page.dart';
import 'pages/settings/profile_settings_page.dart';
import 'pages/settings/settings_page.dart';
import 'pages/splash/splash_screen.dart';
import 'utils/themes.dart';

void main() => runApp(Firefly());

class Firefly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInController>(
          create: (context) => SignInController(),
        ),
        ChangeNotifierProvider<SignUpController>(
          create: (context) => SignUpController(),
        ),
        ChangeNotifierProvider<UserController>(
          create: (context) => UserController(),
        ),
        ChangeNotifierProvider<SongsController>(
          create: (context) => SongsController(),
        ),
        ChangeNotifierProvider<PlayerController>(
          create: (context) => PlayerController(),
        ),
      ],
      child: MaterialApp(
        title: 'Firefly',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        initialRoute: SplashSreen.id,
        routes: {
          SplashSreen.id: (context) => SplashSreen(),
          BottomNavigation.id: (context) => BottomNavigation(),
          LibraryPage.id: (context) => LibraryPage(),
          PlayerPage.id: (context) => PlayerPage(),
          FavoriteSongsPage.id: (context) => FavoriteSongsPage(),
          HomePage.id: (context) => HomePage(),
          SettingsPage.id: (context) => SettingsPage(),
          ProfileSettingsPage.id: (context) => ProfileSettingsPage(),
          WelcomePage.id: (context) => WelcomePage(),
          SignInPage.id: (context) => SignInPage(),
          SignInWithEmailAndPasswordPage.id: (context) =>
              SignInWithEmailAndPasswordPage(),
          AuthWithGooglePage.id: (context) => AuthWithGooglePage(),
          SignUpPage.id: (context) => SignUpPage(),
          SignUpWithEmailAndPasswordPage.id: (context) =>
              SignUpWithEmailAndPasswordPage(),
        },
      ),
    );
  }
}
