import 'package:flutter/cupertino.dart';

class ProjectcreenManager with ChangeNotifier {
  //is hovered on view my works button
  bool _isHovered = false;
  int? _hoveredIndex;
  bool _buttonHovered = false;
  var _listLenght = 9;
  bool _isFrist = true;

  int? _titleButtonindex = 0;
  // int? _selectedButton;
  // double? maxwidth = 0;

  bool get isHovered {
    return _isHovered;
  }

  bool get buttonHovered {
    return _buttonHovered;
  }

  bool get isFrist {
    return _isFrist;
  }

  int get listLenght {
    return _listLenght;
  }

  int? get hoveredIndex {
    return _hoveredIndex;
  }

  int? get titleButtonindex {
    return _titleButtonindex;
  }

  void setListLength(int? length) {
    _listLenght = length!;
    notifyListeners();
  }

  void sethoveredIndex(int? index) {
    _hoveredIndex = index;
    notifyListeners();
  }

  void settitleButtonindex(int? index) {
    _titleButtonindex = index;
    notifyListeners();
  }

  void setIsHovered(bool hover) {
    _isHovered = hover;
    notifyListeners();
  }

  void setButtonHovered(bool hover) {
    _buttonHovered = hover;
    notifyListeners();
  }

  void setisFrist(bool sts) {
    _isFrist = sts;
    notifyListeners();
  }
}
