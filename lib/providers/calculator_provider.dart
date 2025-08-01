import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  final List<String> _operations = [];
  List<String> get operations => _operations;

  void adddata(String value) {
    _operations.add(value);
    notifyListeners();
  }

  void removename(String value) {
    _operations.remove(value);
    notifyListeners();
  }

  void updatedata(int index, String newvalue) {
    _operations[index] = newvalue;
    notifyListeners();
  }
}
