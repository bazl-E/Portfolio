import 'package:flutter/cupertino.dart';

class WelcomescreenManager with ChangeNotifier {
  //is hovered on view my works button
  bool _isplaying = false;

  bool get isPlaying {
    return _isplaying;
  }

  void setplaying(bool state) {
    _isplaying = state;
    notifyListeners();
  }
}
