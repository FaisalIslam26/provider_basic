import 'package:flutter/cupertino.dart';

class ChangeName with ChangeNotifier {
  int _increase = 50;

  int get increase => _increase;

  void increment() {
    _increase++;
    notifyListeners();
  }
}
