import 'package:flutter/cupertino.dart';

class BlogscreenManager with ChangeNotifier {
  //is hovered on view my works button
  bool _isHovered = false;
  int? _hoveredIndex;
  bool _isFrist = true;
  bool get isFrist {
    return _isFrist;
  }

  void setisFrist(bool sts) {
    _isFrist = sts;
    notifyListeners();
  }

  bool get isHovered {
    return _isHovered;
  }

  int? get hoveredIndex {
    return _hoveredIndex;
  }

  void setisHovered(bool state) {
    _isHovered = state;
    notifyListeners();
  }

  void sethoveredIndex(int? ind) {
    _hoveredIndex = ind;
    notifyListeners();
  }
}
