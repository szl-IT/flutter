import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  var _value = 0;

  int get homeValue => _value;

  void addValue() {
    _value += 1;
    notifyListeners();
  }

  void resetValue() {
    _value = 0;
    notifyListeners();
  }
}
