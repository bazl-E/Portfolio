import 'package:flutter/cupertino.dart';

class BodyControllManager with ChangeNotifier {
  //is hovered on view my works button
  bool _isExpaned = true;
  int? _selectedButton;
  int? _currentButton;
  bool _isTaped = false;

  bool get isExpaned {
    return _isExpaned;
  }

  bool get isTaped {
    return _isTaped;
  }

  int? get selectedButton {
    return _selectedButton;
  }

  int? get currentButton {
    return _currentButton;
  }

  void setisisExpaned(bool state) {
    _isExpaned = state;
    notifyListeners();
  }

  void setisisTaped() {
    _isTaped = !_isTaped;
    notifyListeners();
  }

  void setselectedButton(int? ind) {
    _selectedButton = ind;
    notifyListeners();
  }

  void setcurrentButton(int? ind) {
    _currentButton = ind;
    notifyListeners();
  }
}
