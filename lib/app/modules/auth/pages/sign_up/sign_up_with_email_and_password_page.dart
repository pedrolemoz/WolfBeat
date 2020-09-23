import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/models/user/user.dart';
import '../../../ui_components/rounded_button.dart';
import '../../../ui_components/rounded_text_field.dart';
import '../../services/email_and_password/sign_up/email_and_password_sign_up.dart';
import '../../view_model/sign_up/sign_up_view_model.dart';

class SignUpWithEmailAndPasswordPage extends StatelessWidget {
  static String id = 'sign_up_with_email_and_password_page';
  final signUpViewModel = GetIt.I.get<SignUpViewModel>();
  final _nameTextField = TextEditingController();
  final _emailTextField = TextEditingController();
  final _passwordTextField = TextEditingController();
  final _passwordConfirmationTextField = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                        onChanged: () {
                          signUpViewModel.isNameValid(_nameTextField.text);
                          signUpViewModel.canProceed();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: RoundedTextField(
                          textController: _emailTextField,
                          hintText: 'Qual o seu email?',
                          padding: EdgeInsets.symmetric(vertical: 18.0),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: () {
                            signUpViewModel.isEmailValid(_emailTextField.text);
                            signUpViewModel.canProceed();
                          },
                        ),
                      ),
                      RoundedTextField(
                        textController: _passwordTextField,
                        hintText: 'Escolha uma senha forte',
                        padding: EdgeInsets.symmetric(vertical: 18.0),
                        onChanged: () {
                          signUpViewModel
                              .isPasswordValid(_passwordTextField.text);
                          signUpViewModel.canProceed();
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: RoundedTextField(
                          textController: _passwordConfirmationTextField,
                          hintText: 'Digite a senha novamente',
                          padding: EdgeInsets.symmetric(vertical: 18.0),
                          onChanged: () {
                            signUpViewModel.passwordsMatch(
                              _passwordTextField.text,
                              _passwordConfirmationTextField.text,
                            );
                            signUpViewModel.canProceed();
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                      ),
                      RoundedButton(
                        label: 'Cadastrar-se no WolfBeat',
                        isEnabled: signUpViewModel.isEnabled,
                        onTap: () {
                          signUpUserWithEmailAndPassword(
                            context,
                            User(
                              name: _nameTextField.text,
                              email: _emailTextField.text,
                              password: _passwordTextField.text,
                              imageURI:
                                  'https://www.musicdot.com.br/assets/api/share/musicdot.jpg',
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
