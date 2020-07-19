import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/sign_in/sign_in_model.dart';
import 'model/sign_up/sign_up_model.dart';
import 'model/user_data/user_model.dart';
import 'pages/auth/sign_in/sign_in_page.dart';
import 'pages/auth/sign_in/sign_in_with_email_and_password_page.dart';
import 'pages/auth/sign_up/sign_up_page.dart';
import 'pages/auth/sign_up/sign_up_with_email_and_password_page.dart';
import 'pages/bottom_navigation/bottom_navigation_bar.dart';
import 'pages/home/home_page.dart';
import 'pages/library/library_page.dart';
import 'pages/favorite_songs/favorite_songs_page.dart';
import 'pages/player/player_page.dart';
import 'pages/settings/profile_settings_page.dart';
import 'pages/settings/settings_page.dart';
import 'pages/auth/welcome_page.dart';
import 'pages/splash/splash_screen.dart';
import 'utils/themes.dart';

void main() => runApp(Firefly());

class Firefly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInModel>(
          create: (context) => SignInModel(),
        ),
        ChangeNotifierProvider<SignUpModel>(
          create: (context) => SignUpModel(),
        ),
        ChangeNotifierProvider<UserModel>(
          create: (context) => UserModel(),
        ),
      ],
      child: MaterialApp(
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
          // SignInGooglePage.id: (context) => SignInGooglePage(),
          SignUpPage.id: (context) => SignUpPage(),
          SignUpWithEmailAndPasswordPage.id: (context) =>
              SignUpWithEmailAndPasswordPage(),
        },
      ),
    );
  }
}
