import 'package:buts/Features/Home/View/bus_selection_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../SignIn/Controller/sign_in_provider.dart';

class HomePageProvider extends ChangeNotifier {
  PageController _pageController = PageController();
  bool _toCity = true;
  PageController get getPageController => _pageController;
  bool get getToCity => _toCity;
  List<BusSelectionCard> _busCards = [];
  List<BusSelectionCard> get getBusCards => _busCards;
  int _selectedIndex = -1;
  int get getSelectedIndex => _selectedIndex;
  late IO.Socket socket;

  void toggleToCity (){
    _toCity = !_toCity;
    notifyListeners();
  }

  void updateBusCards(){
    _busCards = List.generate(6, (index) => BusSelectionCard(
      index: index,
    ));
    notifyListeners();
  }

  void updateSelectCard(int value){
    _selectedIndex = value;
    notifyListeners();
  }

  // initSocket(String? token) {
  //   socket = IO.io('https://buts-server.onrender.com/', <String, dynamic>{
  //     'autoConnect': true,
  //     'transports': ['websocket'],
  //     'extraHeaders': { 'Authorization' : token }
  //   });
  //   socket.connect();
  //   socket.onConnect((_) {
  //     print('Connection established');
  //   });
  //   socket.onDisconnect((_) => print('Connection Disconnection'));
  //   socket.onConnectError((err) => print(err));
  //   socket.onError((err) => print(err));
  //
  //   socket.on('Connection_Success', (data){
  //     print(data);
  //   });
  //   socket.on('Connection_Error', (data){
  //     print(data);
  //   });
  // }

}