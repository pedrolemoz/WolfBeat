import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../../ui_components/rounded_button.dart';
import '../../../ui_components/rounded_text_field.dart';
import '../../services/email_and_password/recover_email_and_password/recover_with_email.dart';

class RecoverEmailAndPassword extends StatelessWidget {
  static const String id = 'recover_email_and_password';
  final _emailTextField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recuperar senha',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Icon(
                FlutterIcons.lock_open_outline_mco,
                size: 100,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Esqueceu a senha?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Por favor, informe o e-mail associado a sua conta para enviarmos um link de recuperação',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Colors.grey[500]),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            RoundedTextField(
              textController: _emailTextField,
              hintText: 'Insira o email',
              padding: EdgeInsets.symmetric(vertical: 18.0),
              keyboardType: TextInputType.emailAddress,
              onChanged: () {},
            ),
            SizedBox(height: 20),
            RoundedButton(
              label: 'Enviar',
              isEnabled: true,
              onTap: () {
                //função para recuperar a senha
                recover_with_email(context, _emailTextField.text);
              },
              enabledColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
