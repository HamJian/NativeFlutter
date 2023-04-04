package com.example.myapplication;

import android.app.Application;
import android.content.Intent;
import android.util.Log;

import com.idlefish.flutterboost.FlutterBoost;
import com.idlefish.flutterboost.FlutterBoostDelegate;
import com.idlefish.flutterboost.FlutterBoostRouteOptions;
import com.idlefish.flutterboost.containers.FlutterBoostActivity;

import io.flutter.embedding.android.FlutterActivityLaunchConfigs;

public class App extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        FlutterBoost.instance().setup(this, new FlutterBoostDelegate() {
            @Override
            public void pushNativeRoute(FlutterBoostRouteOptions options) {
                Log.d("FlutterBoost", "pushNativeRoute options=" + options);
                switch (options.pageName()) {
                    case "go_to_SecondActivity":
                        //这里根据options.pageName来判断你想跳转哪个页面，这里简单给一个
                        Intent intent = new Intent(FlutterBoost.instance().currentActivity(), SecondActivity.class);
                        intent.putExtra("data", (String) options.arguments().get("data"));
                        intent.putExtra("mobile", (String) options.arguments().get("mobile"));
                        FlutterBoost.instance().currentActivity().startActivity(intent);
                        break;
                }
            }

            @Override
            public void pushFlutterRoute(FlutterBoostRouteOptions options) {
                Log.d("FlutterBoost", "pushFlutterRoute options=" + options.pageName());
                Intent intent = new FlutterScreenActivity.CachedEngineIntentBuilder(FlutterScreenActivity.class)
                        .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.transparent)
                        .destroyEngineWithActivity(false)
                        .uniqueId(options.uniqueId())
                        .url(options.pageName())
                        .urlParams(options.arguments())
                        .build(FlutterBoost.instance().currentActivity());
                if (options.requestCode() == 0) {
                    FlutterBoost.instance().currentActivity().startActivity(intent);
                } else {
                    FlutterBoost.instance().currentActivity().startActivityForResult(intent, options.requestCode());
                }
            }
        }, engine -> {
        });

    }
}
