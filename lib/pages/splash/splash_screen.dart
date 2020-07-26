import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../pages/auth/welcome_page.dart';
import '../../pages/bottom_navigation/bottom_navigation_bar.dart';

class SplashSreen extends StatelessWidget {
  static const String id = 'splash_screen_page';

  Future<void> checkUserAuth(BuildContext context) async {
    var auth = FirebaseAuth.instance;
    var user = await auth.currentUser();

    Navigator.pushNamedAndRemoveUntil(
      context,
      user != null ? BottomNavigation.id : WelcomePage.id,
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
