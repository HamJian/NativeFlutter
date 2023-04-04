package com.example.myapplication;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.android.SplashScreen;

public class ASplashScreen implements SplashScreen {
    View splashView;

    @Nullable
    @Override
    public View createSplashView(@NonNull Context context, @Nullable Bundle savedInstanceState){
        splashView = LayoutInflater.from(context).inflate(R.layout.view_splash, null);
        return splashView;
    }

    @Override
    public void transitionToFlutter(@NonNull Runnable onTransitionComplete){
        if(splashView != null) splashView.setVisibility(View.GONE);
    }

}

