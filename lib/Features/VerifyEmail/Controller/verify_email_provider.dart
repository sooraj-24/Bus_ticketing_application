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

  void updateEmail(String email){
    _email = email;
    notifyListeners();
  }

  void updateState(){
    state = ViewState.Error;
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
    var url = Uri.parse("https://buts.vercel.app/user/usercheck");
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
    var url = Uri.parse("https://buts.vercel.app/user/verifyOTP");
    var data = {
      "username": "20bec105",
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
      state = ViewState.Success;
      _otpVerified = true;
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
}