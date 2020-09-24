import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/helpers/firebase_helper.dart';
import '../../../../../core/models/user/user.dart';
import '../../../../../core/view_model/user/user_view_model.dart';
import '../../../bottom_navigation/pages/bottom_navigation_bar.dart';

/// [authWithGoogle] is a function that connects with the Firebase server,
/// register a google email, and redirects the user to [BottomNavigator].
/// Used in [AuthWithGooglePage].
Future<void> authWithGoogle(BuildContext context) async {
  var auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  var googleSignInAccount = await googleSignIn.signIn();
  var googleSignInAuthentication = await googleSignInAccount.authentication;
  var isRegistered = false;
  var credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);
  var user = ((await auth.signInWithCredential(credential)).user);

  if (user != null) {
    var userGoogle = User(
      name: user.displayName,
      email: user.email,
      imageURI: user.photoUrl,
      uuid: user.uid,
    );

    var db = Firestore.instance;
    await db
        .collection(FirebaseHelper.usersCollection)
        .document(user.uid)
        .setData(userGoogle.toMapGoogle())
        .then((_) {
      GetIt.I.get<UserViewModel>().recoverUserData();
      Navigator.pushNamedAndRemoveUntil(
        context,
        BottomNavigator.id,
        (route) => false,
      );
    });
  } else {
    throw ('Not found');
  }
}
