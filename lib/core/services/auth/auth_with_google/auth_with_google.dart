import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../app/modules/bottom_navigation/pages/bottom_navigation_bar.dart';
import '../../../helpers/firebase_helper.dart';
import '../../../models/user/user.dart';
import '../../../view_model/user/user_view_model.dart';

/// [authWithGoogle] is a function that connects with the Firebase server,
/// register a google email, and redirects the user to [BottomNavigator].
/// Used in [AuthWithGooglePage].
Future<void> authWithGoogle(BuildContext context) async {
  var _auth = FirebaseAuth.instance;
  var _googleSignIn = GoogleSignIn();
  var _googleSignInAccount = await _googleSignIn.signIn();
  var _googleSignInAuthentication = await _googleSignInAccount.authentication;
  var _credential = GoogleAuthProvider.getCredential(
      idToken: _googleSignInAuthentication.idToken,
      accessToken: _googleSignInAuthentication.accessToken);
  var _user = ((await _auth.signInWithCredential(_credential)).user);

  if (_user != null) {
    var _userGoogle = User(
      name: _user.displayName,
      email: _user.email,
      imageURI: _user.photoUrl,
      uuid: _user?.uid,
    );

    var _db = Firestore.instance;
    await _db
        .collection(FirebaseHelper.usersCollection)
        .document(_user?.uid)
        .setData(_userGoogle.toMapGoogle())
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
