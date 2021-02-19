import 'package:flutter/material.dart';

class Repository extends ChangeNotifier {
  ScrollController homeScrollController = ScrollController();
  int _selectedTabIndex = 0;

  int get selectedTabIndex => _selectedTabIndex;
  set selectedTabIndex(int index) {
    print("tab bar cliced index : $index");
    _selectedTabIndex = index;
    notifyListeners();
  }
}