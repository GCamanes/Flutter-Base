package com.example.flutter_base

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "flavor").setMethodCallHandler { call, result ->
            result.success(BuildConfig.FLAVOR)
        }
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "appValues").setMethodCallHandler { call, result ->
            val packageName: String = getPackageName()
            val resId: Int = getResources().getIdentifier(call.method, "string", packageName)
            // Checking if resource is found with the call.method
            if (resId != 0) {
                result.success(getString(resId))
            } else {
                result.notImplemented()
            }
        }
    }
}
