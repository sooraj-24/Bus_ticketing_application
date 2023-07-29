import 'dart:convert';
import 'package:buts/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../Home/Model/bus_model.dart';

class QueueProvider extends ChangeNotifier{
  List<Bus> preferenceList = [];
  ViewState state = ViewState.Idle;
  bool inQueue = false;

  void addBus(Bus bus){
    preferenceList.add(bus);
    notifyListeners();
  }

  void updatePreference(int oldIndex, int newIndex){
    final index = newIndex > oldIndex ? newIndex-1 : newIndex;
    Bus bus = preferenceList.removeAt(oldIndex);
    preferenceList.insert(index, bus);
    notifyListeners();
  }

  void removeBus(int index){
    preferenceList.removeAt(index);
    notifyListeners();
  }

  Future<void> getInQueue(String token) async {
    state = ViewState.Busy;
    notifyListeners();

    http.Response response;
    List<Map<String,String>> mapData = [];
    for (var bus in preferenceList) {
      mapData.add(
          {
            "source": bus.source!,
            "destination": bus.destination!,
            "startTime": bus.startTime!.toIso8601String()
          }
      );
    }
    var url = Uri.parse("https://buts-server.onrender.com/user/queue");
    var data = {
      "preferences": mapData
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
      if(jsonDecode(response.body)["data"] == 'Added to queue successfully'){
        inQueue = true;
      }
      state = ViewState.Success;
      notifyListeners();
    } else {
      state = ViewState.Error;
      notifyListeners();
      throw Exception("Error code: ${response.statusCode}");
    }
  }
}