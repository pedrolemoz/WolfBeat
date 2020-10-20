import 'package:mobx/mobx.dart';

part 'sign_up_view_model.g.dart';

/// [SignUpViewModel] is a widget which validates the creation of a new user.
/// Used in [SignUpWithEmailAndPasswordPage].
class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

/// This is a [Store] for [SignInViewModel]
abstract class _SignUpViewModelBase with Store {
  @observable
  bool _validName = false;

  @observable
  bool _validEmail = false;

  @observable
  bool _validPassword = false;

  @observable
  bool _passwordsMatch = false;

  @observable
  bool isEnabled = false;

  @action
  void isNameValid(String name) => _validName = name?.isNotEmpty;

  @action
  void isEmailValid(String email) => _validEmail = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  @action
  void isPasswordValid(String password) => _validPassword = password.length > 6;

  @action
  void passwordsMatch(String password, String passwordConfirmation) =>
      _passwordsMatch = password == passwordConfirmation;

  @action
  void canProceed() {
    isEnabled = _validName && _validEmail && _validPassword && _passwordsMatch;
  }
}
