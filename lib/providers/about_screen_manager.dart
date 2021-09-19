import 'package:flutter/cupertino.dart';

class AboutscreenManager with ChangeNotifier {
  bool _isFrist = true;
  bool get isFrist {
    return _isFrist;
  }

  void setisFrist(bool sts) {
    _isFrist = sts;
    notifyListeners();
  }
}
