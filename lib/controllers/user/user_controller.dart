import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../pages/auth/welcome_page.dart';

/// [UserController] is a widget that receives the user information from Firebase.
/// It's a set of methods.
/// Used in [ProfileSettingsPage], [SettingsPage], [loginUserWithEmailAndPassword].
class UserController extends ChangeNotifier {
  UserController() {
    recoverUserData();
  }

  String userID = '';
  String userName = '';
  String userEmail = '';
  String imageURI = 'https://www.musicdot.com.br/assets/api/share/musicdot.jpg';
  String type = '';

  Future<void> recoverUserData() async {
    var auth = FirebaseAuth.instance;
    var database = Firestore.instance;
    var user = await auth.currentUser();

    var snapshot = await database.collection('users').document(user.uid).get();

    var data = snapshot.data;

    if (data.isNotEmpty) {
      userID = user.uid;
      userName = data['name'];
      userEmail = data['email'];
      imageURI = data['imageURI'];
      type = data['type'];
    }

    notifyListeners();
  }

  Future<void> signOutUser(BuildContext context) async {
    var auth = FirebaseAuth.instance;
    var googleSignIn = GoogleSignIn();

    await auth.signOut().then((value) {
      googleSignIn.signOut().then((_) {
        print('Logged out');
      });
    });

    Navigator.pushNamedAndRemoveUntil(
      context,
      WelcomePage.id,
      (route) => false,
    );
  }

  void updateImageURI(String newImageURI) {
    imageURI = newImageURI;
    notifyListeners();
  }
}
