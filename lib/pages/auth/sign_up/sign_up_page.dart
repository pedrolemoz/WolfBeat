import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'sign_up_with_email_and_password_page.dart';
import '../../../components/rounded_button.dart';
// import 'sign_in_google_page.dart';

class SignUpPage extends StatelessWidget {
  static String id = 'sign_up_page';

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
                    label: 'Cadastrar-se com o Google',
                    onTap: () {
                      // Navigator.pushNamed(context, SignInGooglePage.id);
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
                      label: 'Cadastrar-se com o Facebook',
                      onTap: () {},
                      icon:
                          Icon(FontAwesomeIcons.facebook, color: Colors.white),
                      enabledColor: Colors.blue[600],
                      splashColor: Colors.blue[900],
                      isEnabled: true,
                    ),
                  ),
                  RoundedButton(
                    label: 'Cadastrar-se com o email e senha',
                    onTap: () {
                      Navigator.pushNamed(
                          context, SignUpWithEmailAndPasswordPage.id);
                    },
                    borderColor: Colors.white,
                    splashColor: Colors.black,
                    isEnabled: true,
                  ),
                ],
              ),
              Text(
                'Ao cadastrar-se com Google, Facebook ou com email e senha, você aceita os termos de uso das respectivas plataformas.',
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
