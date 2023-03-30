import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SignInProvider extends ChangeNotifier {
  String _password = '';
  bool _isPasswordVisible = false;
  String get getPassword => _password;
  bool get getIsPasswordVisible => _isPasswordVisible;

  void updatePassword(String password){
    _password = password;
    notifyListeners();
  }

  void togglePasswordVisibility(){
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

}