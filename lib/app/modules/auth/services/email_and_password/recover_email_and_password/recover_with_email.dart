import 'package:WolfBeat/app/modules/auth/pages/sign_in/sign_in_page.dart';
import 'package:WolfBeat/app/modules/auth/services/email_and_password/recover_email_and_password/recover_email_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> recover_with_email(BuildContext context, String email) async {
  assert(context != null);
  var auth = FirebaseAuth.instance;
  await auth.sendPasswordResetEmail(email: email).then((_) {
    Navigator.pushNamed(context, Recover_email_page.id);
    // Navigator.pushNamed(context, SignInPage.id);
  });
}
