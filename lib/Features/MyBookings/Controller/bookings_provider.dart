import 'package:buts/Constants/constants.dart';
import 'package:buts/Features/MyBookings/Model/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookingsProvider extends ChangeNotifier {
  ViewState state = ViewState.Idle;
  late Bookings bookings;

  Future<void> getBookings(String token) async {
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
      print(response.body);
      state = ViewState.Success;
      notifyListeners();
    } else {
      state = ViewState.Error;
      notifyListeners();
      throw Exception("Error code: ${response.statusCode}");
    }
  }
}