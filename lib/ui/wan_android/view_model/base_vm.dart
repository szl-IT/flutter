import 'package:flutter/cupertino.dart';

enum LoadState { init, loading, success, failed }

class BaseViewModel with ChangeNotifier {
  var state = LoadState.init;

  void updateLoadState(LoadState loadState) {
    state = loadState;
    notifyListeners();
  }
}
