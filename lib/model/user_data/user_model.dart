import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../pages/auth/welcome_page.dart';

class UserModel extends ChangeNotifier {
  UserModel() {
    recoverUserData();
  }

  String userID;
  String userName;
  String userEmail;
  String imageURI;
  String type;

  Future<void> recoverUserData() async {
    final auth = FirebaseAuth.instance;
    final Firestore database = Firestore.instance;
    final user = await auth.currentUser();

    DocumentSnapshot snapshot =
        await database.collection('users').document(user.uid).get();

    Map<String, dynamic> data = snapshot.data;

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
    final auth = FirebaseAuth.instance;
    await auth.signOut();

    // TODO: Adicionar o sign out do Google

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
