import 'package:flutter/material.dart';
class CartCounterProvider extends ChangeNotifier {
  int _numOfItems = 1;

  int get numOfItems => _numOfItems;

  void increment() {
    _numOfItems++;
    notifyListeners();
  }

  void decrement() {
    if (_numOfItems > 1) {
      _numOfItems--;
      notifyListeners();
    }
  }
}
