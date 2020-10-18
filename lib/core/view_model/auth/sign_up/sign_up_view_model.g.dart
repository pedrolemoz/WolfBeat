// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpViewModel on _SignUpViewModelBase, Store {
  final _$_validNameAtom = Atom(name: '_SignUpViewModelBase._validName');

  @override
  bool get _validName {
    _$_validNameAtom.reportRead();
    return super._validName;
  }

  @override
  set _validName(bool value) {
    _$_validNameAtom.reportWrite(value, super._validName, () {
      super._validName = value;
    });
  }

  final _$_validEmailAtom = Atom(name: '_SignUpViewModelBase._validEmail');

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
      Atom(name: '_SignUpViewModelBase._validPassword');

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

  final _$_passwordsMatchAtom =
      Atom(name: '_SignUpViewModelBase._passwordsMatch');

  @override
  bool get _passwordsMatch {
    _$_passwordsMatchAtom.reportRead();
    return super._passwordsMatch;
  }

  @override
  set _passwordsMatch(bool value) {
    _$_passwordsMatchAtom.reportWrite(value, super._passwordsMatch, () {
      super._passwordsMatch = value;
    });
  }

  final _$isEnabledAtom = Atom(name: '_SignUpViewModelBase.isEnabled');

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

  final _$_SignUpViewModelBaseActionController =
      ActionController(name: '_SignUpViewModelBase');

  @override
  void isNameValid(String name) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.isNameValid');
    try {
      return super.isNameValid(name);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isEmailValid(String email) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.isEmailValid');
    try {
      return super.isEmailValid(email);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isPasswordValid(String password) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.isPasswordValid');
    try {
      return super.isPasswordValid(password);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void passwordsMatch(String password, String passwordConfirmation) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.passwordsMatch');
    try {
      return super.passwordsMatch(password, passwordConfirmation);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void canProceed() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.canProceed');
    try {
      return super.canProceed();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEnabled: ${isEnabled}
    ''';
  }
}
