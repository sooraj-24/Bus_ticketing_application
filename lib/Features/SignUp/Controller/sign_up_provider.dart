import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  String _rollNo = '';
  String _username = '';
  String _password = '';
  String _rollNoErrorText = '';
  String _passwordErrorText = '';
  String _usernameErrorText = '';
  bool _rollNoError = false;
  bool _usernameError = false;
  bool _passwordError = false;
  bool _confirmPassError = false;

  String get getRollNo => _rollNo;
  bool get getRollNoError => _rollNoError;
  String get getRollNoErrorText => _rollNoErrorText;
  String get getUsername => _username;
  bool get getUsernameError => _usernameError;
  String get getUsernameErrorText => _usernameErrorText;
  String get getPassword => _password;
  bool get getPasswordError => _passwordError;
  String get getPasswordErrorText => _passwordErrorText;
  bool get getConfirmPassError => _confirmPassError;

  void updateRollNo(String rollNo){
    _rollNo = rollNo;
    notifyListeners();
  }

  void updateRollNoError(bool error){
    _rollNoError = error;
    notifyListeners();
  }

  void updateRollNoErrorText(String text){
    _rollNoErrorText = text;
    notifyListeners();
  }

  void updateUsername(String username){
    _username = username;
    notifyListeners();
  }

  void updateUsernameError(bool error){
    _usernameError = error;
    notifyListeners();
  }

  void updateUsernameErrorText(String text){
    _usernameErrorText = text;
    notifyListeners();
  }

  void updatePassword(String text){
    _password = text;
    notifyListeners();
  }

  void updatePasswordError(bool error){
    _passwordError = error;
    notifyListeners();
  }

  void updatePasswordErrorText(String text){
    _passwordErrorText = text;
    notifyListeners();
  }

  void updateConfirmPassError(bool error){
    _confirmPassError = error;
    notifyListeners();
  }
}