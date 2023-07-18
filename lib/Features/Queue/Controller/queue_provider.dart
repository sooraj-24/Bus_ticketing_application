import 'package:flutter/material.dart';

class QueueProvider extends ChangeNotifier{
  List<String> buses = ['Bus1', 'Bus2', 'Bus3', 'Bus4', 'Bus5', 'Bus6', 'Bus7'];

  void updatePreference(int oldIndex, int newIndex){
    final index = newIndex > oldIndex ? newIndex-1 : newIndex;
    String bus = buses.removeAt(oldIndex);
    buses.insert(index, bus);
    notifyListeners();
  }
  void removeBus(int index){
    buses.removeAt(index);
    notifyListeners();
  }
}