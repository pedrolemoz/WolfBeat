import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../../pages/bottom_navigation/bottom_navigation_bar.dart';

/// [signUpUserWithEmailAndPassword] is a method that connects with the Firebase
/// server, register a email, and redirects the user to the page [BottomNavigation].
/// It's a auth with a navigator inside.
/// Used in [SignUpWithEmailAndPasswordPage].
Future<void> signUpUserWithEmailAndPassword(
    BuildContext context, User user) async {
  assert(context != null);
  var database = Firestore.instance;

  var auth = FirebaseAuth.instance;
  auth
      .createUserWithEmailAndPassword(
          email: user.email, password: user.password)
      .then((firebaseUser) {
    user.uuid = firebaseUser.user.uid;
    database
        .collection('users')
        .document(firebaseUser.user.uid)
        .setData(user.toMap());
    Navigator.pushNamedAndRemoveUntil(
      context,
      BottomNavigation.id,
      (route) => false,
    );
  }).catchError((onError) {
    print(onError);
    print('Unable to register. Try again later!');
  });
}
