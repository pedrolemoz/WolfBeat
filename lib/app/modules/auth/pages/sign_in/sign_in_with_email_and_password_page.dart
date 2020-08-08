import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/models/user/user.dart';
import '../../../ui_components/rounded_button.dart';
import '../../../ui_components/rounded_text_field.dart';
import '../../services/email_and_password/sign_in/email_and_password_sign_in.dart';
import '../../view_model/sign_in/sign_in_view_model.dart';

class SignInWithEmailAndPasswordPage extends StatelessWidget {
  static String id = 'sign_in_with_email_and_password_page';
  final signInViewModel = GetIt.I.get<SignInViewModel>();

  @override
  Widget build(BuildContext context) {
    final _emailTextField = TextEditingController();
    final _passwordTextField = TextEditingController();

    return Observer(
      builder: (_) {
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
                    'Insira suas credenciais',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Column(
                    children: [
                      RoundedTextField(
                        textController: _emailTextField,
                        hintText: 'Insira seu email',
                        padding: EdgeInsets.symmetric(vertical: 18.0),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: () {
                          signInViewModel.isEmailValid(_emailTextField.text);
                          signInViewModel.canProceed();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: RoundedTextField(
                          textController: _passwordTextField,
                          hintText: 'Insira sua senha',
                          padding: EdgeInsets.symmetric(vertical: 18.0),
                          onChanged: () {
                            signInViewModel
                                .isPasswordValid(_passwordTextField.text);
                            signInViewModel.canProceed();
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                      ),
                      RoundedButton(
                        label: 'Entrar no Firefly',
                        isEnabled: signInViewModel.isEnabled,
                        onTap: () {
                          loginUserWithEmailAndPassword(
                            context,
                            User(
                              email: _emailTextField.text,
                              password: _passwordTextField.text,
                            ),
                          );
                        },
                        enabledColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  Text(
                    // ignore: lines_longer_than_80_chars
                    'Ao entrar com email e senha, você aceita os termos de uso da plataforma.',
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
      },
    );
  }
}
