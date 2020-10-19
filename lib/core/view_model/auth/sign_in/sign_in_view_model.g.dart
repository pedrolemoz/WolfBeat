// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInViewModel on _SignInViewModelBase, Store {
  final _$_validEmailAtom = Atom(name: '_SignInViewModelBase._validEmail');

  @override
  bool get _validEmail {
    _$_validEmailAtom.reportRead();
    return super._validEmail;
  }

  @override
  set _validEmail(bool value) {
    _$_validEmailAtom.reportWrite(value, super._validEmail, () {
      super._validEmail = value;
    });
  }

  final _$_validPasswordAtom =
      Atom(name: '_SignInViewModelBase._validPassword');

  @override
  bool get _validPassword {
    _$_validPasswordAtom.reportRead();
    return super._validPassword;
  }

  @override
  set _validPassword(bool value) {
    _$_validPasswordAtom.reportWrite(value, super._validPassword, () {
      super._validPassword = value;
    });
  }

  final _$isEnabledAtom = Atom(name: '_SignInViewModelBase.isEnabled');

  @override
  bool get isEnabled {
    _$isEnabledAtom.reportRead();
    return super.isEnabled;
  }

  @override
  set isEnabled(bool value) {
    _$isEnabledAtom.reportWrite(value, super.isEnabled, () {
      super.isEnabled = value;
    });
  }

  final _$_SignInViewModelBaseActionController =
      ActionController(name: '_SignInViewModelBase');

  @override
  void isEmailValid(String email) {
    final _$actionInfo = _$_SignInViewModelBaseActionController.startAction(
        name: '_SignInViewModelBase.isEmailValid');
    try {
      return super.isEmailValid(email);
    } finally {
      _$_SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isPasswordValid(String password) {
    final _$actionInfo = _$_SignInViewModelBaseActionController.startAction(
        name: '_SignInViewModelBase.isPasswordValid');
    try {
      return super.isPasswordValid(password);
    } finally {
      _$_SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void canProceed() {
    final _$actionInfo = _$_SignInViewModelBaseActionController.startAction(
        name: '_SignInViewModelBase.canProceed');
    try {
      return super.canProceed();
    } finally {
      _$_SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEnabled: ${isEnabled}
    ''';
  }
}
