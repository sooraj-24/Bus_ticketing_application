import 'package:buts/Features/Home/View/bus_selection_card.dart';
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  PageController _pageController = PageController();
  bool _toCity = true;
  PageController get getPageController => _pageController;
  bool get getToCity => _toCity;
  List<BusSelectionCard> _busCards = [];
  List<BusSelectionCard> get getBusCards => _busCards;
  int _selectedIndex = -1;
  int get getSelectedIndex => _selectedIndex;

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
}