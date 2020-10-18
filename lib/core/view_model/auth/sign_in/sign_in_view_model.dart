import 'package:mobx/mobx.dart';

part 'sign_in_view_model.g.dart';

/// [SignInViewModel] validates the login of an email by the user.
/// Used in [SignInWithEmailAndPasswordPage].
class SignInViewModel = _SignInViewModelBase with _$SignInViewModel;

/// This is a [Store] for [SignInViewModel]
abstract class _SignInViewModelBase with Store {
  @observable
  bool _validEmail = false;

  @observable
  bool _validPassword = false;

  @observable
  bool isEnabled = false;

  @action
  void isEmailValid(String email) => _validEmail =
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(email)
          ? true
          : false;

  @action
  void isPasswordValid(String password) =>
      _validPassword = password.length > 6 ? true : false;

  @action
  void canProceed() {
    isEnabled = _validEmail && _validPassword ? true : false;
  }
}
