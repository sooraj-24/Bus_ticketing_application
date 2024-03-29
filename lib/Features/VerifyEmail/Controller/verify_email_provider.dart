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
  bool _otpVerified = false;
  bool get isOtpVerified => _otpVerified;
  String token = "";
  String _password = '';
  String _passwordErrorText = '';
  bool _passwordError = false;
  bool _confirmPassError = false;
  String get getPassword => _password;
  bool get getPasswordError => _passwordError;
  String get getPasswordErrorText => _passwordErrorText;
  bool get getConfirmPassError => _confirmPassError;
  bool passwordReset = false;

  void updateEmail(String email){
    _email = email;
    notifyListeners();
  }

  void updateState(){
    state = ViewState.Error;
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

  String getUserEmail(){
    if(user.email != null){
      return user.email!;
    } else {
      return "User does not exist, please Sign Up";
    }
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

  Future<void> verifyOtp(String otp) async {
    state = ViewState.Busy;
    notifyListeners();

    http.Response response;
    var url = Uri.parse("https://buts-server.onrender.com/user/verifyOTP");
    var data = {
      "username": _email,
      "otp": otp
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
      Map<String,dynamic> output = jsonDecode(response.body);
      token = output["token"];
      _otpVerified = true;
      state = ViewState.Success;
      notifyListeners();
    } else if(response.statusCode == 400){
      state = ViewState.Error;
      _otpVerified = false;
      notifyListeners();
      throw Exception("Invalid OTP!");
    } else {
      state = ViewState.Error;
      _otpVerified = false;
      notifyListeners();
      throw Exception("Error code: ${response.statusCode}");
    }
    state = ViewState.Success;
    notifyListeners();
  }

  Future<void> verifyForgotPassOTP(String otp) async {
    _otpVerified = false;
    state = ViewState.Busy;
    notifyListeners();

    http.Response response;
    var url = Uri.parse("https://buts-server.onrender.com/user/resetPassVerifyOTP");
    var data = {
      "username": _email,
      "otp": otp
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
      Map<String,dynamic> output = jsonDecode(response.body);
      token = output["token"];
      _otpVerified = true;
      state = ViewState.Success;
      notifyListeners();
    } else if(response.statusCode == 400){
      state = ViewState.Error;
      _otpVerified = false;
      notifyListeners();
      throw Exception("Invalid OTP!");
    } else {
      state = ViewState.Error;
      _otpVerified = false;
      notifyListeners();
      throw Exception("Error code: ${response.statusCode}");
    }
    state = ViewState.Success;
    notifyListeners();
  }

  Future<void> resetPass() async {
    state = ViewState.Busy;
    notifyListeners();

    http.Response response;
    var url = Uri.parse("https://buts-server.onrender.com/user/resetPassVerifyOTP");
    var data = {
      "newpass": _password
    };
    var body = json.encode(data);
    response = await http.patch(url,body: body,headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).catchError((e){
      state = ViewState.Error;
      notifyListeners();
      throw Exception(e.toString());
    });
    if(response.statusCode == 200){
      Map<String,dynamic> output = jsonDecode(response.body);
      if(output["message"] == "Password reset successfully"){
        passwordReset = true;
      }
      state = ViewState.Success;
      notifyListeners();
    } else {
      state = ViewState.Error;
      _otpVerified = false;
      notifyListeners();
      throw Exception("Error code: ${response.statusCode}");
    }
    state = ViewState.Success;
    notifyListeners();
  }
}