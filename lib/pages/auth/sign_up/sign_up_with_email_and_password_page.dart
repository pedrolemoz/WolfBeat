import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/sign_up/email_and_password_sign_up.dart';
import '../../../model/sign_up/sign_up_model.dart';
import '../../../model/user.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_text_field.dart';

class SignUpWithEmailAndPasswordPage extends StatelessWidget {
  static String id = 'sign_up_with_email_and_password_page';

  @override
  Widget build(BuildContext context) {
    final _nameTextField = TextEditingController();
    final _emailTextField = TextEditingController();
    final _passwordTextField = TextEditingController();
    final _passwordConfirmationTextField = TextEditingController();

    return Consumer<SignUpModel>(
      builder: (context, signUpModel, child) {
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
                          signUpModel.isNameValid(_nameTextField.text);
                          signUpModel.canProceed();
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
                            signUpModel.isEmailValid(_emailTextField.text);
                            signUpModel.canProceed();
                          },
                        ),
                      ),
                      RoundedTextField(
                        textController: _passwordTextField,
                        hintText: 'Escolha uma senha forte',
                        padding: EdgeInsets.symmetric(vertical: 18.0),
                        onChanged: () {
                          signUpModel.isPasswordValid(_passwordTextField.text);
                          signUpModel.canProceed();
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
                            signUpModel.passwordsMatch(
                              _passwordTextField.text,
                              _passwordConfirmationTextField.text,
                            );
                            signUpModel.canProceed();
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                      ),
                      RoundedButton(
                        label: 'Cadastrar-se no Firefly',
                        isEnabled: signUpModel.isEnabled,
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
