import 'dart:convert';

import 'package:buts/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../SignIn/Model/user_model.dart';

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
  
  ViewState state = ViewState.Idle;
  late UserModel user;

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

  Future<void> registerUser(String token) async {
    state = ViewState.Busy;
    notifyListeners();
    http.Response response;
    var url = Uri.parse("https://buts-server.onrender.com/user/register");
    var data = {
      "name": _username,
      "password": _password,
      "rollNo": _rollNo
    };
    var body = jsonEncode(data);
    response = await http.post(url,body: body,headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).catchError((e){
      state = ViewState.Error;
      notifyListeners();
      throw Exception(e.toString());
    });
    if(response.statusCode == 200){
      user = userModelFromJson(response.body);
      notifyListeners();
    } else {
      state = ViewState.Error;
      notifyListeners();
      throw Exception("Error code: ${response.statusCode}");
    }
    state = ViewState.Success;
    notifyListeners();
  }
}