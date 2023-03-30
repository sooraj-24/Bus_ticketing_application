import 'package:flutter/material.dart';

class VerifyEmailProvider extends ChangeNotifier {
  String _email = '';
  String get getEmail => _email;

  void updateEmail(String email){
    _email = email;
    notifyListeners();
  }
}