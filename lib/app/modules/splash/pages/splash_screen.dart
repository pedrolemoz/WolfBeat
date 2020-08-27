import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../bottom_navigation/pages/bottom_navigation_bar.dart';
import '../../welcome/pages/welcome_page.dart';

class SplashSreen extends StatelessWidget {
  static const String id = 'splash_screen_page';

  Future<void> checkUserAuth(BuildContext context) async {
    var auth = FirebaseAuth.instance;
    var user = await auth.currentUser();

    Navigator.pushNamedAndRemoveUntil(
      context,
      user != null ? BottomNavigator.id : WelcomePage.id,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    checkUserAuth(context);
    return Scaffold(
      body: Center(
        child: Image.network(
          'https://images-na.ssl-images-amazon.com/images/I/815aiIN6wmL.jpg',
        ),
      ),
    );
  }
}
