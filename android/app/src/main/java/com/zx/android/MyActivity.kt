package com.zx.android

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.zx.android.R

/**
 * MyActivity
 * Created by zxx on 2019-12-26 10:23
 *
 */
 class MyActivity :AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_page1)
//        StatusBarUtil.setTransparentForWindow(this)
//        StatusBarUtil.setDarkMode(this)
    }

}