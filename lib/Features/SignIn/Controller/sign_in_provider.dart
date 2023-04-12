import 'dart:convert';

import 'package:buts/Features/VerifyEmail/Model/verify_user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../../Constants/constants.dart';
import '../Model/user_model.dart';

class SignInProvider extends ChangeNotifier {
  String _password = '';
  bool _isPasswordVisible = false;
  String get getPassword => _password;
  bool get getIsPasswordVisible => _isPasswordVisible;
  ViewState state = ViewState.Idle;
  late UserModel user;

  void updatePassword(String password){
    _password = password;
    notifyListeners();
  }

  void togglePasswordVisibility(){
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future fetchData(String email) async {
    state = ViewState.Busy;
    notifyListeners();
    http.Response response;
    var url = Uri.parse("https://buts-server.onrender.com/user/loginUser");
    var data = {
      "password": _password,
      "email": email,
    };
    var body = json.encode(data);
    response = await http.post(url,body: body,headers: {
      "Content-Type": "application/json"
    }).catchError((e){
      state = ViewState.Error;
      notifyListeners();
      throw Exception(e.toString());
    });
    if(response.statusCode == 200){
      user = userModelFromJson(response.body);
    } else {
      state = ViewState.Error;
      notifyListeners();
      throw Exception("Error code: ${response.statusCode}");
    }
    state = ViewState.Success;
    notifyListeners();
  }

  void updateState(){
    state = ViewState.Error;
    notifyListeners();
  }

}