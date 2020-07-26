import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import '../../../components/rounded_button.dart';
import '../auth_with_google_page.dart';
import 'sign_in_with_email_and_password_page.dart';

class SignInPage extends StatelessWidget {
  static String id = 'sign_in_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.network(
                    'https://images-na.ssl-images-amazon.com/images/I/815aiIN6wmL.jpg',
                    height: 180.0,
                  ),
                ],
              ),
              Text(
                'Escolha uma opção para continuar',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
              Column(
                children: [
                  RoundedButton(
                    label: 'Fazer login com o Google',
                    onTap: () {
                      Navigator.pushNamed(context, AuthWithGooglePage.id);
                    },
                    enabledColor: Color(0xFFF0F0F5),
                    icon:
                        Icon(FontAwesomeIcons.google, color: Colors.blue[600]),
                    textColor: Theme.of(context).backgroundColor,
                    splashColor: Colors.grey[500],
                    isEnabled: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: RoundedButton(
                      label: 'Fazer login com o Facebook',
                      onTap: () {},
                      icon:
                          Icon(FontAwesomeIcons.facebook, color: Colors.white),
                      enabledColor: Colors.blue[600],
                      splashColor: Colors.blue[900],
                      isEnabled: true,
                    ),
                  ),
                  RoundedButton(
                    label: 'Fazer login com o email e senha',
                    onTap: () {
                      Navigator.pushNamed(
                          context, SignInWithEmailAndPasswordPage.id);
                    },
                    borderColor: Colors.white,
                    splashColor: Colors.black,
                    isEnabled: true,
                  ),
                ],
              ),
              Text(
                // ignore: lines_longer_than_80_chars
                'Ao entrar com Google, Facebook ou com email e senha, você aceita os termos de uso das respectivas plataformas.',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Colors.grey[500]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
