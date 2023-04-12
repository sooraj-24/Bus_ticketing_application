import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../Constants/constants.dart';
import '../Model/verify_user_model.dart';

class VerifyEmailProvider extends ChangeNotifier {
  String _email = '';
  String get getEmail => _email;
  late VerifyUserModel user;
  ViewState state = ViewState.Idle;

  void updateEmail(String email){
    _email = email;
    notifyListeners();
  }

  void updateState(){
    state = ViewState.Error;
    notifyListeners();
  }

  Future fetchData() async {
    state = ViewState.Busy;
    notifyListeners();
    http.Response response;
    var url = Uri.parse("https://buts-server.onrender.com/user/usercheck");
    var data = {
      "username": _email
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
      user = verifyUserModelFromJson(response.body);
    } else {
      state = ViewState.Error;
      notifyListeners();
      throw Exception("Error code: ${response.statusCode}");
    }
    state = ViewState.Success;
    notifyListeners();
  }

  String getUserEmail(){
    if(user.email != null){
      return user.email!;
    } else {
      return "User does not exist, please Sign Up";
    }
  }
}