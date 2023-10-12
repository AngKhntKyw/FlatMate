import 'dart:developer';
import 'package:flutter/material.dart';

class LogInProvider with ChangeNotifier {
  String _email = '';
  String get email => _email;

  String _password = '';
  String get password => _password;

  bool _isPasswordObscure = true;
  bool get isPasswordObscure => _isPasswordObscure;

  bool _isEmailAndPasswordFilled = false;
  bool get isEmailAndPasswordFilled => _isEmailAndPasswordFilled;

  bool _isLoginIn = false;
  bool get isLoginIn => _isLoginIn;

  bool _isLogInButtonDisable = false;
  bool get isLogInButtonDisable => _isLogInButtonDisable;

  FocusNode _emailFocusNode = FocusNode();
  FocusNode get emailFocusNode => _emailFocusNode;

  FocusNode _passwordFocusNode = FocusNode();
  FocusNode get passwordFocusNode => _passwordFocusNode;

  void saveEmail(String email) {
    _email = email;

    log("Email : $email");
    log("Logging? : $isLoginIn");
    _isEmailAndPasswordFilled =
        email.isNotEmpty && password.isNotEmpty ? true : false;

    notifyListeners();
  }

  void savePassword(String password) {
    _password = password;
    log("Password : $password");

    _isEmailAndPasswordFilled =
        password.isNotEmpty && email.isNotEmpty ? true : false;

    notifyListeners();
  }

  void obscurePassword(bool obscurePassword) {
    _isPasswordObscure = obscurePassword;
    log(isPasswordObscure.toString());
    notifyListeners();
  }

  void loginIn(bool loginIn) {
    _isLoginIn = loginIn;
    notifyListeners();
  }

  void disableLoginButton(bool disableLoginButton) {
    _isLogInButtonDisable = disableLoginButton;
    notifyListeners();
  }

  void unFocusNodes() {
    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();
  }

  void restartLogInProvider() {
    _email = '';
    _password = '';
    _isPasswordObscure = true;
    _isEmailAndPasswordFilled = false;
    _isLoginIn = false;
    _isLogInButtonDisable = false;
    // _emailFocusNode.dispose();
    // _passwordFocusNode.dispose();
  }
}
