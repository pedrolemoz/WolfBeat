import 'dart:async';
import 'dart:ffi';

import 'package:WolfBeat/app/modules/auth/pages/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';

class Recover_email_page extends StatefulWidget {
  static String id = 'recover_email_page';

  @override
  _Recover_email_pageState createState() => _Recover_email_pageState();
}

class _Recover_email_pageState extends State<Recover_email_page> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, SignInPage.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Email de recuperação enviado para o email cadastrado',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: Colors.grey[500]),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'Aguarde',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: Colors.grey[500]),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFBA110B)))
              ]),
        ),
      ),
    );
  }
}
