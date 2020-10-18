import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/modules/auth/pages/auth_with_google/auth_with_google_page.dart';
import 'app/modules/auth/pages/recover_email_and_password/recover_email_and_password.dart';
import 'app/modules/auth/pages/recover_email_and_password/recover_email_page.dart';
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
import 'app/modules/playlist/pages/create_new_playlist_page.dart';
import 'app/modules/search/view_model/search_view_model.dart';
import 'app/modules/settings/pages/profile_settings_page.dart';
import 'app/modules/settings/pages/settings_page.dart';
import 'app/modules/welcome/pages/welcome_page.dart';
import 'core/view_model/player/player_view_model.dart';
import 'core/view_model/song/songs_view_model.dart';
import 'core/view_model/user/user_view_model.dart';
import 'utils/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerSingletons();
  runApp(WolfBeat());
}

/// This function register new singletons to
/// manage the state of the app
void registerSingletons() {
  var getIt = GetIt.I;

  getIt.registerSingleton<UserViewModel>(UserViewModel());
  getIt.registerSingleton<SignInViewModel>(SignInViewModel());
  getIt.registerSingleton<SignUpViewModel>(SignUpViewModel());
  getIt.registerSingleton<SongsViewModel>(SongsViewModel());
  getIt.registerSingleton<PlayerViewModel>(PlayerViewModel());
  getIt.registerSingleton<SearchViewModel>(SearchViewModel());
}

/// App root
class WolfBeat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WolfBeat',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: WelcomePage.id,
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        BottomNavigator.id: (context) => BottomNavigator(),
        LibraryPage.id: (context) => LibraryPage(),
        CreateNewPlaylistPage.id: (context) => CreateNewPlaylistPage(),
        PlayerPage.id: (context) => PlayerPage(),
        FavoriteSongsPage.id: (context) => FavoriteSongsPage(),
        HomePage.id: (context) => HomePage(),
        SettingsPage.id: (context) => SettingsPage(),
        ProfileSettingsPage.id: (context) => ProfileSettingsPage(),
        SignInPage.id: (context) => SignInPage(),
        SignInWithEmailAndPasswordPage.id: (context) =>
            SignInWithEmailAndPasswordPage(),
        AuthWithGooglePage.id: (context) => AuthWithGooglePage(),
        SignUpPage.id: (context) => SignUpPage(),
        SignUpWithEmailAndPasswordPage.id: (context) =>
            SignUpWithEmailAndPasswordPage(),
        RecoverEmailAndPassword.id: (context) => RecoverEmailAndPassword(),
        RecoverEmailPage.id: (context) => RecoverEmailPage(),
      },
    );
  }
}
