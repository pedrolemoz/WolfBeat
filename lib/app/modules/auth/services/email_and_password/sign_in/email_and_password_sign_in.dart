import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/models/user/user.dart';
import '../../../../bottom_navigation/pages/bottom_navigation_bar.dart';
import '../../../view_model/user/user_view_model.dart';

/// [loginUserWithEmailAndPassword] is a Method that connects with the Firebase
/// server, login the user, and redirects the user to the page [BottomNavigation].
/// It's a auth with a Navigator inside.
/// Used in [SignInWithEmailAndPasswordPage].
Future<void> loginUserWithEmailAndPassword(
    BuildContext context, User user) async {
  assert(context != null);
  var auth = FirebaseAuth.instance;

  await auth
      .signInWithEmailAndPassword(email: user.email, password: user.password)
      .then((firebaseUser) {
    Provider.of<UserViewModel>(context, listen: false).recoverUserData();
    Navigator.pushNamedAndRemoveUntil(
      context,
      BottomNavigator.id,
      (route) => false,
    );
  }).catchError((error) {
    print(error);
    print('Unable to register. Try again later!');
  });
}
