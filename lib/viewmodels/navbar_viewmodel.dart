import 'package:flutter/material.dart';

class BottomNavViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (index != _currentIndex) {
      _currentIndex = index;
      notifyListeners();
    }
  }
}