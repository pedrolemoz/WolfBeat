import 'package:flutter/foundation.dart';

class SignInModel extends ChangeNotifier {
  bool _validEmail = false;
  bool _validPassword = false;
  bool isEnabled = false;

  void isEmailValid(String email) => _validEmail =
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(email)
          ? true
          : false;

  void isPasswordValid(String password) =>
      _validPassword = password.length > 6 ? true : false;

  void canProceed() {
    isEnabled = _validEmail && _validPassword ? true : false;
    notifyListeners();
  }
}
