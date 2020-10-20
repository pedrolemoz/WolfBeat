import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/helpers/assets_helper.dart';
import '../../../../../core/models/user/user.dart';
import '../../../../../core/services/auth/email_and_password/sign_up/email_and_password_sign_up.dart';
import '../../../../../core/view_model/auth/sign_up/sign_up_view_model.dart';
import '../../../ui_components/rounded_button.dart';
import '../../../ui_components/rounded_text_field.dart';

class SignUpWithEmailAndPasswordPage extends StatelessWidget {
  static String id = 'sign_up_with_email_and_password_page';

  final _nameTextField = TextEditingController();
  final _emailTextField = TextEditingController();
  final _passwordTextField = TextEditingController();
  final _passwordConfirmationTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _signUpViewModel = GetIt.I.get<SignUpViewModel>();
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
                    'Informe seus dados',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Column(
                    children: [
                      RoundedTextField(
                        textController: _nameTextField,
                        hintText: 'Qual o seu nome?',
                        padding: EdgeInsets.symmetric(vertical: 18.0),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        onChanged: () {
                          _signUpViewModel.isNameValid(_nameTextField.text);
                          _signUpViewModel.canProceed();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: RoundedTextField(
                          textController: _emailTextField,
                          hintText: 'Qual o seu email?',
                          padding: EdgeInsets.symmetric(vertical: 18.0),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          onChanged: () {
                            _signUpViewModel.isEmailValid(_emailTextField.text);
                            _signUpViewModel.canProceed();
                          },
                        ),
                      ),
                      RoundedTextField(
                        textController: _passwordTextField,
                        hintText: 'Escolha uma senha forte',
                        padding: EdgeInsets.symmetric(vertical: 18.0),
                        onChanged: () {
                          _signUpViewModel
                              .isPasswordValid(_passwordTextField.text);
                          _signUpViewModel.canProceed();
                        },
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: RoundedTextField(
                          textController: _passwordConfirmationTextField,
                          hintText: 'Digite a senha novamente',
                          padding: EdgeInsets.symmetric(vertical: 18.0),
                          textInputAction: TextInputAction.done,
                          onChanged: () {
                            _signUpViewModel.passwordsMatch(
                              _passwordTextField.text,
                              _passwordConfirmationTextField.text,
                            );
                            _signUpViewModel.canProceed();
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                      ),
                      RoundedButton(
                        label: 'Cadastrar-se no WolfBeat',
                        isEnabled: _signUpViewModel.isEnabled,
                        onTap: () {
                          signUpUserWithEmailAndPassword(
                            context,
                            User(
                              name: _nameTextField.text,
                              email: _emailTextField.text,
                              password: _passwordTextField.text,
                              imageURI:
                                  'https://firebasestorage.googleapis.com/v0/b/firefly-c82b1.appspot.com/o/fallback%2Fuser%2Fuser_fallback.jpg?alt=media&token=bc968227-e42a-4a3b-aa7a-9abf22b4f22b',
                            ),
                          );
                        },
                        enabledColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  Text(
                    // ignore: lines_longer_than_80_chars
                    'Ao cadastrar-se com email e senha, você aceita os termos de uso da plataforma.',
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
