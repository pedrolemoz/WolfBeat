import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/user.dart';
import '../../pages/bottom_navigation/bottom_navigation_bar.dart';

Future<void> authWithGoogle(BuildContext context) async {
  var auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  var googleSignInAccount = await googleSignIn.signIn();
  var googleSignInAuthentication = await googleSignInAccount.authentication;

  var credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);
  var user = ((await auth.signInWithCredential(credential)).user);

  if (user != null) {
    var userGoogle = User();

    userGoogle.name = user.displayName;
    userGoogle.email = user.email;
    userGoogle.imageURI = user.photoUrl;
    userGoogle.uuid = user.uid;

    var db = Firestore.instance;
    db
        .collection('users')
        .document(user.uid)
        .setData(userGoogle.toMapGoogle())
        .then((_) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        BottomNavigation.id,
        (route) => false,
      );
    });
  } else {
    throw ('Not found');
  }
}
