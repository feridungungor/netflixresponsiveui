import 'package:flutter/material.dart';

class Repository extends ChangeNotifier {
  ScrollController homeScrollController = ScrollController();
  ScrollController comingsoonScrollController = ScrollController();
  ScrollController searchpageScrollController = ScrollController();
  int _selectedTabIndex = 0;

  int get selectedTabIndex => _selectedTabIndex;
  set selectedTabIndex(int index) {
    print("tab bar cliced index : $index");
    _selectedTabIndex = index;
    notifyListeners();
  }
  /////////////////////////
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;


  set selectedIndex(int index) {
    print("tab bar clicked index : $index");
    _selectedIndex = index;
    notifyListeners();
  }

}