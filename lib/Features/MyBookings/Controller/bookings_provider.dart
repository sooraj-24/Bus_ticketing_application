import 'dart:convert';
import 'package:buts/Constants/constants.dart';
import 'package:buts/Features/MyBookings/Model/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookingsProvider extends ChangeNotifier {
  ViewState state = ViewState.Idle;
  late Bookings bookings;
  String code = "";

  Future<void> getBookings(String token) async {
    print(token);
    http.Response response;
    var url = Uri.parse("https://buts-server.onrender.com/user/bookings");
    response = await http.get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).catchError((e){
      state = ViewState.Error;
      notifyListeners();
      throw Exception(e.toString());
    });
    if(response.statusCode == 200){
      bookings = bookingsFromJson(response.body);
      state = ViewState.Success;
      notifyListeners();
    } else {
      state = ViewState.Error;
      notifyListeners();
      throw Exception("Error code: ${response.statusCode}");
    }
  }

  Future<void> getQR(String token, String busId) async {
    state = ViewState.Busy;
    notifyListeners();
    http.Response response;
    var url = Uri.parse("https://buts-server.onrender.com/user/QR");
    var data = {
      "busId": busId
    };
    var body = jsonEncode(data);
    response = await http.post(url, body: body, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    }).catchError((e){
      state = ViewState.Error;
      notifyListeners();
      throw Exception(e.toString());
    });
    if(response.statusCode == 200){
      print(response.body);
      var responseBody = json.decode(response.body);
      if(responseBody["message"] == "Session Not Started yet"){
        state = ViewState.Error;
        notifyListeners();
        throw Exception("Session not started yet");
      }
      code = responseBody["message"];
      state = ViewState.Success;
      notifyListeners();
    } else {
      state = ViewState.Error;
      notifyListeners();
      throw Exception("Error code: ${response.statusCode}");
    }
  }
}