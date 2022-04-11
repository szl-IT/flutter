package com.example.flutter_study

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity

class FirstActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_first)
    }
}