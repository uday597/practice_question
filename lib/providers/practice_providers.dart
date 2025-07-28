import 'package:flutter/material.dart';

class MethodsProvider extends ChangeNotifier {
  final List<String> _names = ['uday', 'edf', 'dss'];
  List<String> get names => _names;

  void addname(String value) {
    _names.add(value);
    notifyListeners();
  }

  void removename(String value) {
    _names.remove(value);
    notifyListeners();
  }
}

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  void increment() {
    _counter++;
    notifyListeners();
  }
}
