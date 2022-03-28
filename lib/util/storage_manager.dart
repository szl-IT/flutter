import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

///存储管理
class StorageManager {
  static SharedPreferences? sharedPreferences;
  static LocalStorage? localStorage;

  void init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    localStorage = LocalStorage("Local_Storage");
    await localStorage?.ready;
  }
}
