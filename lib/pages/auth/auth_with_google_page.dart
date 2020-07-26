import 'package:flutter/material.dart';

import '../../controllers/auth/auth_with_google.dart';

class AuthWithGooglePage extends StatefulWidget {
  static String id = 'auth_with_google_page';

  @override
  _AuthWithGooglePageState createState() => _AuthWithGooglePageState();
}

class _AuthWithGooglePageState extends State<AuthWithGooglePage> {
  @override
  void initState() {
    super.initState();
    authWithGoogle(context);
  }

  // TODO: Criar telas para caso o usuário já tenha conta

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
