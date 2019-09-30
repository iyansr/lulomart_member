import 'package:flutter/foundation.dart';

class FetchProduct with ChangeNotifier {
  int _scrollLen = 6;
  get scrollLen => _scrollLen;

  void setScrollLen(int max) {
    _scrollLen += 6;
    notifyListeners();
    if (_scrollLen > max) {
      _scrollLen = max;
      notifyListeners();
    }
  }
}
