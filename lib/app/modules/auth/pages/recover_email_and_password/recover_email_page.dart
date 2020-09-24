import 'dart:async';

import 'package:flutter/material.dart';

import '../sign_in/sign_in_page.dart';

class RecoverEmailPage extends StatefulWidget {
  static String id = 'recover_email_page';

  @override
  _RecoverEmailPageState createState() => _RecoverEmailPageState();
}

class _RecoverEmailPageState extends State<RecoverEmailPage> {
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
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
