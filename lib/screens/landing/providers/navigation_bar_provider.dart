import 'package:flutter/material.dart';

class AppNavigationBarProvider with ChangeNotifier {
  AppNavigationBarProvider();

  ScrollController scrollController = ScrollController();

  bool _iconInstaOnHover = false;
  bool get iconInstaOnHover => _iconInstaOnHover;
  set iconInstaOnHover(bool newValue) {
    _iconInstaOnHover = newValue;
    notifyListeners();
  }

  bool _iconWaOnHover = false;
  bool get iconWaOnHover => _iconWaOnHover;
  set iconWaOnHover(bool newValue) {
    _iconWaOnHover = newValue;
    notifyListeners();
  }

  bool _cartOnHover = false;
  bool get cartOnHover => _cartOnHover;
  set cartOnHover(bool newValue) {
    _cartOnHover = newValue;
    notifyListeners();
  }

  bool _userOnHover = false;
  bool get userOnHover => _userOnHover;
  set userOnHover(bool newValue) {
    _userOnHover = newValue;
    notifyListeners();
  }

  int _hoveredMenu = -1;
  int get hoveredMenu => _hoveredMenu;
  set hoveredMenu(int newValue) {
    _hoveredMenu = newValue;
    notifyListeners();
  }
}
