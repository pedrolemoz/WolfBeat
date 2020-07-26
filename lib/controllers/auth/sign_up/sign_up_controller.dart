import 'package:flutter/foundation.dart';

class SignUpController extends ChangeNotifier {
  bool _validName = false;
  bool _validEmail = false;
  bool _validPassword = false;
  bool _passwordsMatch = false;
  bool isEnabled = false;

  void isNameValid(String name) => _validName = name.isNotEmpty;

  void isEmailValid(String email) => _validEmail = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  void isPasswordValid(String password) => _validPassword = password.length > 6;

  void passwordsMatch(String password, String passwordConfirmation) =>
      _passwordsMatch = password == passwordConfirmation;

  void canProceed() {
    isEnabled = _validName && _validEmail && _validPassword && _passwordsMatch;
    notifyListeners();
  }
}
