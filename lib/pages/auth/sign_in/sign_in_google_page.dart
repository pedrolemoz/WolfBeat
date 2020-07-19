// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firefly/model/user.dart';
// import 'package:firefly/pages/home/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class SignInGooglePage extends StatelessWidget {
//   static String id = 'sign_in_google_page';

//   final FirebaseAuth auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();

//   @override
//   Widget build(BuildContext context) {
//     _signInGoogle() async {
//       final googleSignInAccount = await googleSignIn.signIn();
//       final googleSignInAuthentication =
//           await googleSignInAccount.authentication;
//       final credential = GoogleAuthProvider.getCredential(
//           idToken: googleSignInAuthentication.idToken,
//           accessToken: googleSignInAuthentication.accessToken);
//       final user = ((await auth.signInWithCredential(credential)).user);

//       if (user != null) {
//         User userGoogle = User();
//         userGoogle.name = user.displayName;
//         userGoogle.email = user.email;
//         userGoogle.imageURI = user.photoUrl;
//         Firestore db = Firestore.instance;
//         db
//             .collection('users')
//             .document(user.uid)
//             .setData(userGoogle.toMapGoogle())
//             .then((_) {
//           Navigator.pushReplacementNamed(context, HomePage.id);
//         });
//       } else {
//         throw ('Not found');
//       }
//     }

//     // _signInGoogle();

//     return Scaffold();
//   }
// }
