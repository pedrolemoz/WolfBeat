import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/modules/auth/pages/auth_with_google/auth_with_google_page.dart';
import 'app/modules/auth/pages/sign_in/sign_in_page.dart';
import 'app/modules/auth/pages/sign_in/sign_in_with_email_and_password_page.dart';
import 'app/modules/auth/pages/sign_up/sign_up_page.dart';
import 'app/modules/auth/pages/sign_up/sign_up_with_email_and_password_page.dart';
import 'app/modules/auth/view_model/sign_in/sign_in_view_model.dart';
import 'app/modules/auth/view_model/sign_up/sign_up_view_model.dart';
import 'app/modules/bottom_navigation/pages/bottom_navigation_bar.dart';
import 'app/modules/favorite_songs/pages/favorite_songs_page.dart';
import 'app/modules/home/pages/home_page.dart';
import 'app/modules/library/pages/library_page.dart';
import 'app/modules/player/pages/player_page.dart';
import 'app/modules/search/view_model/search_view_model.dart';
import 'app/modules/settings/pages/profile_settings_page.dart';
import 'app/modules/settings/pages/settings_page.dart';
import 'app/modules/splash/pages/splash_screen.dart';
import 'app/modules/welcome/pages/welcome_page.dart';
import 'core/view_model/player/player_view_model.dart';
import 'core/view_model/song/songs_view_model.dart';
import 'core/view_model/user/user_view_model.dart';
import 'utils/themes.dart';

void main() => runApp(Firefly());

/// App root
class Firefly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInViewModel>(
          create: (context) => SignInViewModel(),
        ),
        ChangeNotifierProvider<SignUpViewModel>(
          create: (context) => SignUpViewModel(),
        ),
        ChangeNotifierProvider<UserViewModel>(
          create: (context) => UserViewModel(),
        ),
        ChangeNotifierProvider<SongsViewModel>(
          create: (context) => SongsViewModel(),
        ),
        ChangeNotifierProvider<PlayerViewModel>(
          create: (context) => PlayerViewModel(),
        ),
        ChangeNotifierProvider<SearchViewModel>(
          create: (context) => SearchViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Firefly',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        initialRoute: SplashSreen.id,
        routes: {
          SplashSreen.id: (context) => SplashSreen(),
          BottomNavigator.id: (context) => BottomNavigator(),
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
