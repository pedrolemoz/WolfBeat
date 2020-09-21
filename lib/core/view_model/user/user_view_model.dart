import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

import '../../../app/modules/welcome/pages/welcome_page.dart';

part 'user_view_model.g.dart';

/// [UserViewModel] receives the user information from Firebase.
/// Used in [ProfileSettingsPage], [SettingsPage]
/// and in [loginUserWithEmailAndPassword].
class UserViewModel = _UserViewModelBase with _$UserViewModel;

/// This is a [Store] for [UserViewModel]
abstract class _UserViewModelBase with Store {
  _UserViewModelBase() {
    recoverUserData();
  }

  @observable
  String userID = '';

  @observable
  String userName = '';

  @observable
  String userEmail = '';

  @observable
  String imageURI = 'https://www.musicdot.com.br/assets/api/share/musicdot.jpg';

  @observable
  String type = '';

  @action
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
  }

  @action
  Future<void> signOutUser(BuildContext context) async {
    var auth = FirebaseAuth.instance;
    var googleSignIn = GoogleSignIn();

    await auth.signOut().then((value) {
      googleSignIn.signOut().then((_) {
        debugPrint('Logged out');
      });
    });

    await Navigator.pushNamedAndRemoveUntil(
      context,
      WelcomePage.id,
      (route) => false,
    );
  }

  // ignore: use_setters_to_change_properties
  @action
  void updateImageURI(String newImageURI) => imageURI = newImageURI;
}
