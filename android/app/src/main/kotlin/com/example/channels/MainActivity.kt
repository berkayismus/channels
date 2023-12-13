package com.example.channels

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel

class MainActivity : FlutterActivity() {

    // * dart tarafındaki event channel adıyla aynı olması gerekiyor 
    private val networkEventChannel = "platform_channel_events/connectivity"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, networkEventChannel)
            .setStreamHandler(NetworkStreamHandler(this))
        
       
    }

}
