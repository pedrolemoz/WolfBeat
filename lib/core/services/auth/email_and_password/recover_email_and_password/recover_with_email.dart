import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../app/modules/auth/pages/recover_email_and_password/recover_email_page.dart';
import '../../../../exceptions/null_attribute_exception.dart';

Future<void> recover_with_email(BuildContext context, String email) async {
  assert(context != null, throw NullAttributeException('context'));
  var _auth = FirebaseAuth.instance;
  await _auth.sendPasswordResetEmail(email: email).then((_) {
    Navigator.pushNamed(context, RecoverEmailPage.id);
  });
}
