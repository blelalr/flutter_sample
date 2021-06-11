import 'package:flutter/foundation.dart';

class CounterProvider extends ChangeNotifier {
  var _count = 0;
  int get getCounter {
    return _count;
  }

  void incrementCount() {
    _count ++;
    notifyListeners();
  }

  void decrementCount() {
    _count --;
    notifyListeners();
  }
}
