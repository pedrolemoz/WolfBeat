import 'package:WolfBeat/core/helpers/assets_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/models/user/user.dart';
import '../../../../../core/view_model/auth/sign_in/sign_in_view_model.dart';
import '../../../ui_components/rounded_button.dart';
import '../../../ui_components/rounded_text_field.dart';
import '../../services/email_and_password/sign_in/email_and_password_sign_in.dart';
import '../recover_email_and_password/recover_email_and_password.dart';

class SignInWithEmailAndPasswordPage extends StatelessWidget {
  static String id = 'sign_in_with_email_and_password_page';

  final _emailTextField = TextEditingController();
  final _passwordTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _signInViewModel = GetIt.I.get<SignInViewModel>();
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
                      Hero(
                        tag: 'Logo',
                        child: Image.asset(
                          AssetsHelper.wolfBeatLogo,
                          height: 180.0,
                        ),
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
                        textInputAction: TextInputAction.done,
                        onChanged: () {
                          _signInViewModel.isEmailValid(_emailTextField.text);
                          _signInViewModel.canProceed();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: RoundedTextField(
                          textController: _passwordTextField,
                          hintText: 'Insira sua senha',
                          padding: EdgeInsets.symmetric(vertical: 18.0),
                          textInputAction: TextInputAction.done,
                          onChanged: () {
                            _signInViewModel
                                .isPasswordValid(_passwordTextField.text);
                            _signInViewModel.canProceed();
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                      ),
                      RoundedButton(
                        label: 'Entrar no WolfBeat',
                        isEnabled: _signInViewModel.isEnabled,
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RecoverEmailAndPassword.id);
                    },
                    child: Text(
                      'Esqueceu a senha?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(color: Colors.grey[500]),
                    ),
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
