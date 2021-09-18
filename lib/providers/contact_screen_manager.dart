import 'package:flutter/cupertino.dart';

class ContactscreenManager with ChangeNotifier {
  //is hovered on view my works button
  bool _isSubmitHovered = false;
  bool _issocialHovered = false;
  bool _isFormSaving = false;
  bool _isHomeButtonHovered = false;

  int? _socialHoveredindex;

  bool get isSubmitHovered {
    return _isSubmitHovered;
  }

  bool get issocialHovered {
    return _issocialHovered;
  }

  bool get isFormSaving {
    return _isFormSaving;
  }

  bool get isHomeButtonHovered {
    return _isHomeButtonHovered;
  }

  int? get socialHoveredindex {
    return _socialHoveredindex;
  }

  void setisSubmitHovered(bool state) {
    _isSubmitHovered = state;
    notifyListeners();
  }

  void setissocialHovered(bool state) {
    _issocialHovered = state;
    notifyListeners();
  }

  void setisFormSaving(bool state) {
    _isFormSaving = state;
    notifyListeners();
  }

  void setisHomeButtonHovered(bool state) {
    _isHomeButtonHovered = state;
    notifyListeners();
  }

  void setsocialHoveredindex(int? ind) {
    _socialHoveredindex = ind;
    notifyListeners();
  }
}
