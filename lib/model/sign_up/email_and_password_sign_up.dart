import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../pages/bottom_navigation/bottom_navigation_bar.dart';
import '../user.dart';

Future<void> signUpUserWithEmailAndPassword(context, User user) async {
  Firestore database = Firestore.instance;

  FirebaseAuth auth = FirebaseAuth.instance;
  auth
      .createUserWithEmailAndPassword(
          email: user.email, password: user.password)
      .then((firebaseUser) {
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
    print('Unable to register. Try again later!');
  });
}
