import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/user_data/user_model.dart';
import '../../pages/bottom_navigation/bottom_navigation_bar.dart';
import '../user.dart';

Future<void> loginUserWithEmailAndPassword(context, User user) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  await auth
      .signInWithEmailAndPassword(email: user.email, password: user.password)
      .then((firebaseUser) {
    Provider.of<UserModel>(context, listen: false).recoverUserData();
    Navigator.pushNamedAndRemoveUntil(
      context,
      BottomNavigation.id,
      (route) => false,
    );
  }).catchError((error) {
    // Caso o usuario nao exista ou der erro em outra coisa ele entra no catch erro
    print('Unable to register. Try again later!');
  });
}
