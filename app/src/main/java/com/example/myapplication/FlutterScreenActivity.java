package com.example.myapplication;

import androidx.annotation.Nullable;

import com.idlefish.flutterboost.containers.FlutterBoostActivity;

import io.flutter.embedding.android.SplashScreen;

public class FlutterScreenActivity extends FlutterBoostActivity {

    @Nullable
    @Override
    public SplashScreen provideSplashScreen() {
        return new ASplashScreen();
    }
}
