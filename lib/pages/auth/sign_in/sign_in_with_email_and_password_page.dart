import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/sign_in/email_and_password_sign_in.dart';
import '../../../model/sign_in/sign_in_model.dart';
import '../../../model/user.dart';
import '../../../components/rounded_button.dart';
import '../../../components/rounded_text_field.dart';

class SignInWithEmailAndPasswordPage extends StatelessWidget {
  static String id = 'sign_in_with_email_and_password_page';

  @override
  Widget build(BuildContext context) {
    final _emailTextField = TextEditingController();
    final _passwordTextField = TextEditingController();

    return Consumer<SignInModel>(
      builder: (context, signInModel, child) {
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
                          signInModel.isEmailValid(_emailTextField.text);
                          signInModel.canProceed();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: RoundedTextField(
                          textController: _passwordTextField,
                          hintText: 'Insira sua senha',
                          padding: EdgeInsets.symmetric(vertical: 18.0),
                          onChanged: () {
                            signInModel
                                .isPasswordValid(_passwordTextField.text);
                            signInModel.canProceed();
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                      ),
                      RoundedButton(
                        label: 'Entrar no Firefly',
                        isEnabled: signInModel.isEnabled,
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
