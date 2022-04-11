package com.example.flutter_study

import android.util.Log
import io.flutter.app.FlutterApplication

class MyApplication : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        Log.e("szl", "onCreate")
    }
}