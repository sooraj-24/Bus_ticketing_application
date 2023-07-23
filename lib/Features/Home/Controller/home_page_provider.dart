import 'dart:convert';
import 'package:buts/Constants/constants.dart';
import 'package:buts/Features/Home/Model/bus_model.dart';
import 'package:buts/Features/Wallet/Model/wallet.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_client_sse/flutter_client_sse.dart';

class HomePageProvider extends ChangeNotifier {
  PageController _pageController = PageController();
  bool _toCity = true;
  PageController get getPageController => _pageController;
  bool get getToCity => _toCity;
  int _selectedIndex = -1;
  int get getSelectedIndex => _selectedIndex;
  late BusResponse busResponse;
  List<Bus> busesToCity = [];
  List<Bus> busesToInstitute = [];
  ViewState state = ViewState.Idle;
  int walletPage = 1;
  late Wallet walletDetails;

  void toggleToCity (){
    _toCity = !_toCity;
    notifyListeners();
  }

  void updateSelectCard(int value){
    _selectedIndex = value;
    notifyListeners();
  }

  void showMoreTransactions(){
    walletPage++;
    notifyListeners();
  }

  void getBuses(String token){
    try{
      SSEClient.subscribeToSSE(url: "https://buts-server.onrender.com/user/busdata", header: {
        "Authorization": "Bearer $token"
      }).listen((event) {
        try {
          busResponse = busResponseFromJson(event.data!);
        } catch(e) {
          var updatedResponse = json.decode(event.data!);
          if(updatedResponse["status"] == true){
            busResponse.data?[busResponse.data!.indexWhere((element) => element.id == updatedResponse["data"]["_id"])] = Bus.fromJson(updatedResponse["data"]);
          }
        }
        busesToCity = List.from(busResponse.data!.where((element) => element.destination == "Sadar"));
        busesToInstitute = List.from(busResponse.data!.where((element) => element.destination == "Insti"));
        state = ViewState.Success;
        notifyListeners();
      });
    } catch(e){
      print("error ${e.toString()}");
    }
  }

  Future<bool> bookTicket(String token) async {
    state = ViewState.Busy;
    notifyListeners();

    http.Response response;
    var url = Uri.parse("https://buts-server.onrender.com/user/bookticket");
    var data;
    if(_toCity){
      data = {
        "source": busesToCity[_selectedIndex].source,
        "destination": busesToCity[_selectedIndex].destination,
        "startTime": busesToCity[_selectedIndex].startTime?.toIso8601String()
      };
    } else {
      data = {
        "source": busesToInstitute[_selectedIndex].source,
        "destination": busesToInstitute[_selectedIndex].destination,
        "startTime": busesToInstitute[_selectedIndex].startTime?.toIso8601String()
      };
    }
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
      var status = json.decode(response.body);
      if(status["status"]){
        state = ViewState.Success;
        notifyListeners();
        return true;
      } else {
        state = ViewState.Error;
        notifyListeners();
        throw Exception(status["message"]);
      }
    } else {
      state = ViewState.Error;
      notifyListeners();
      throw Exception(json.decode(response.body)["message"]);
    }
  }

  Future<void> getWallet(String token, bool isShow) async {
    if(isShow){
      state = ViewState.Busy;
      notifyListeners();
    }
    http.Response response;
    var url = Uri.parse("https://buts-server.onrender.com/user/wallet");
    var data = {
      "page": walletPage
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
      if(walletPage == 1){
        walletDetails = walletFromJson(response.body);
      } else {
        print("here");
        walletDetails.transactions?.addAll(walletFromJson(response.body).transactions as Iterable<Transaction>);
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