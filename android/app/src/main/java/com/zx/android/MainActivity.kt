package com.zx.android

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.zx.android.flutter.BaseFlutterActivity
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        btn_main.setOnClickListener{
            var intent2 = Intent(this, BaseFlutterActivity::class.java)
            intent2.putExtra(BaseFlutterActivity.EXTRA_ROUTE, "/home")
            intent2.putExtra("background_mode", "opaque")
            startActivity(intent2)
        }
        btn_page1.setOnClickListener{
//            startActivity(
//                FlutterActivity
//                    .withNewEngine()
//                    .initialRoute("/user_list")
//                    .build(this)
//            )
            var intent2 = Intent(this, BaseFlutterActivity::class.java)
            intent2.putExtra(BaseFlutterActivity.EXTRA_ROUTE, "/user_list")
            intent2.putExtra("background_mode", "opaque")
            startActivity(intent2)
        }
        btn_page2.setOnClickListener{
            var intent2 = Intent(this, BaseFlutterActivity::class.java)
            intent2.putExtra(BaseFlutterActivity.EXTRA_ROUTE, "/product_list")
            intent2.putExtra("background_mode", "opaque")
            startActivity(intent2)
        }
//        btn_main.performClick()
    }
}
