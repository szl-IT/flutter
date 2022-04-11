import 'package:flutter/services.dart';

class JumpToActivity {
  static const MethodChannel _channel = MethodChannel('plugin_demo');
  static Future<String> pushFirstActivity(Map params) async {
    String resultStr = await _channel.invokeMethod('jumpToActivity', params);
    return resultStr;
  }

  static Future<String> pushSplashActivity(Map params) async {
    String resultStr = await _channel.invokeMethod('jumpToSplash', params);
    return resultStr;
  }

}
