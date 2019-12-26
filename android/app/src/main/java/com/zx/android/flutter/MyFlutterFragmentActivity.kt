package com.zx.android.flutter

import android.os.Bundle
import android.view.MenuItem
import android.view.Window
import androidx.fragment.app.FragmentActivity
import androidx.fragment.app.FragmentManager
import com.zx.android.util.StatusBarUtil
import io.flutter.embedding.android.FlutterFragment


/**
 * MyFlutterFragmentActivity
 * Created by zxx on 2019-12-20 18:44
 *
 */
 class MyFlutterFragmentActivity : FragmentActivity() {
    companion object {
        const val EXTRA_IS_FULLSREEN = "is_fullsreen"
        const val EXTRA_NO_TITLEBAR = "no_titlebar"
        const val STYLE_NO_TITLE = 1
        const val STYLE_FULLSREEN = 2
    }

    private var noTitleBar: Boolean = false
    private var isFullSreen: Boolean = false

    // Define a tag String to represent the FlutterFragment within this
    // Activity's FragmentManager. This value can be whatever you'd like.
    private val TAG_FLUTTER_FRAGMENT = "flutter_fragment"

    // Declare a local variable to reference the FlutterFragment so that you
// can forward calls to it later.
    private var flutterFragment: FlutterFragment? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Inflate a layout that has a container for your FlutterFragment. For
        // this example, assume that a FrameLayout exists with an ID of
        // R.id.fragment_container.
//        setContentView(R.layout.activity_fragment_layout)

        // Get a reference to the Activity's FragmentManager to add a new
        // FlutterFragment, or find an existing one.
        val fragmentManager: FragmentManager = supportFragmentManager

        // Attempt to find an existing FlutterFragment, in case this is not the
        // first time that onCreate() was run.
        flutterFragment = fragmentManager
            .findFragmentByTag(TAG_FLUTTER_FRAGMENT) as FlutterFragment?

        // Create and attach a FlutterFragment if one does not exist.
        if (flutterFragment == null) {
//            FlutterFragment.withCachedEngine("").build<FlutterFragment>()
            var newFlutterFragment = FlutterFragment.createDefault()
            flutterFragment = newFlutterFragment
            // TODO FlutterFragment 不兼容androidx.fragment.app.Fragment
//            fragmentManager
//                .beginTransaction()
//                .add(
//                    R.id.fragment_container,
//                    newFlutterFragment,
//                    TAG_FLUTTER_FRAGMENT
//                )
//                .commit()
        }

    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when (item.itemId) {
//            R.id.home -> {
//                finish()
//                return true
//            }
        }
        return super.onOptionsItemSelected(item)
    }

    override fun onPostResume() {
        super.onPostResume()
        flutterFragment!!.onPostResume()
    }

    override fun onBackPressed() {
        flutterFragment!!.onBackPressed()
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<String?>,
        grantResults: IntArray
    ) {
        flutterFragment!!.onRequestPermissionsResult(
            requestCode,
            permissions,
            grantResults
        )
    }

    override fun onUserLeaveHint() {
        flutterFragment!!.onUserLeaveHint()
    }

    override fun onTrimMemory(level: Int) {
        super.onTrimMemory(level)
        flutterFragment!!.onTrimMemory(level)
    }

    // 设置titlebar风格
    private fun customizeStatusBarStyle() {
        noTitleBar = intent.getBooleanExtra(EXTRA_NO_TITLEBAR, false)
        isFullSreen = intent.getBooleanExtra(EXTRA_IS_FULLSREEN, false)
        if (noTitleBar || isFullSreen) {
            requestWindowFeature(Window.FEATURE_NO_TITLE)
        } else {
            requestWindowFeature(Window.FEATURE_ACTION_BAR)
        }
        if (isFullSreen) {
            StatusBarUtil.translucentStatus(window)
//            StatusBarUtil.changeStatusBarTextColor(window, true)
        }
    }
}