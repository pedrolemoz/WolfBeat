import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../core/exceptions/null_attribute_exception.dart';
import '../../../../../../core/helpers/firebase_helper.dart';
import '../../../../../../core/models/user/user.dart';
import '../../../../../../core/view_model/user/user_view_model.dart';
import '../../../../bottom_navigation/pages/bottom_navigation_bar.dart';

/// [signUpUserWithEmailAndPassword] is a method that connects with the Firebase
/// server, register a email, and redirects the user to [BottomNavigation].
/// Used in [SignUpWithEmailAndPasswordPage].
Future<void> signUpUserWithEmailAndPassword(
    BuildContext context, User user) async {
  assert(context != null, throw NullAttributeException('context'));
  var _database = Firestore.instance;

  var _auth = FirebaseAuth.instance;
  await _auth
      .createUserWithEmailAndPassword(
          email: user.email, password: user.password)
      .then((firebaseUser) {
    _database
        .collection(FirebaseHelper.usersCollection)
        .document(firebaseUser.user.uid)
        .setData(user.toMap());
    GetIt.I.get<UserViewModel>().recoverUserData();
    Navigator.pushNamedAndRemoveUntil(
      context,
      BottomNavigator.id,
      (route) => false,
    );
  }).catchError((onError) {
    debugPrint(onError);
    debugPrint('Unable to register. Try again later!');
  });
}
