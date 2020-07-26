import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/user.dart';
import '../../../pages/bottom_navigation/bottom_navigation_bar.dart';
import '../../user/user_controller.dart';

Future<void> loginUserWithEmailAndPassword(
    BuildContext context, User user) async {
  assert(context != null);
  var auth = FirebaseAuth.instance;

  await auth
      .signInWithEmailAndPassword(email: user.email, password: user.password)
      .then((firebaseUser) {
    Provider.of<UserController>(context, listen: false).recoverUserData();
    Navigator.pushNamedAndRemoveUntil(
      context,
      BottomNavigation.id,
      (route) => false,
    );
  }).catchError((error) {
    print(error);
    print('Unable to register. Try again later!');
  });
}
