package com.example.myapplication

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import com.idlefish.flutterboost.FlutterBoost
import com.idlefish.flutterboost.FlutterBoostRouteOptions

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        findViewById<Button>(R.id.btnFlutter).setOnClickListener {
            val params: MutableMap<String, Any> = HashMap()
            params["string"] = "我是原生传过来的数据"
            FlutterBoost.instance().open( FlutterBoostRouteOptions.Builder()
                .pageName("homepage")
                .opaque(false)
                .arguments(params)
                .build())
        }
    }
}