package com.example.flutter_study

import android.content.Intent
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity : FlutterActivity() {
    private val CHANNEL = "plugin_demo"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "jumpToActivity" -> {
                    // 参数
                    val params: String? = call.argument("name")
                    // 跳转
                    val intent = Intent(this@MainActivity, FirstActivity::class.java)
                    intent.putExtra("activityKey", params)
                    startActivity(intent)
                    result.success(params)
                }
                "jumpToSplash" -> {
                    Log.e("szl", "jumpToSplash")
                }
                else -> result.notImplemented()
            }
        }
    }
}
