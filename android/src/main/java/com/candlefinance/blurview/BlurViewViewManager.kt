package com.candlefinance.blurview

import android.os.Build
import android.view.View
import android.view.ViewGroup
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp
import eightbitlab.com.blurview.BlurView
import eightbitlab.com.blurview.RenderEffectBlur
import eightbitlab.com.blurview.RenderScriptBlur

class BlurViewViewManager : SimpleViewManager<View>() {
  override fun getName() = "BlurViewView"

  private var blurReduction = 4f
  private var blurRadius = 50f

  override fun createViewInstance(reactContext: ThemedReactContext): View {
    val blurView = BlurView(reactContext.baseContext).also {
      it.layoutParams = ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
      val decorView = reactContext.currentActivity
      val rootView = decorView?.findViewById(android.R.id.content) as ViewGroup
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
        it.setupWith(rootView, RenderEffectBlur())
          .setFrameClearDrawable(it.background)
      } else {
        it.setupWith(rootView, RenderScriptBlur(reactContext.baseContext))
          .setFrameClearDrawable(it.background)
      }
    }
    return blurView
  }

  @ReactProp(name = "blurRadius")
  fun setBlurRadius(view: BlurView, blurRadius: Float) {
    view.setBlurEnabled(blurRadius != 0f)
    if (blurRadius > 0f) {
      view.setBlurRadius(blurRadius / blurReduction)
      view.invalidate()
    }
    this.blurRadius = blurRadius
  }

  @ReactProp(name = "blurTintColor")
  fun applyTint(view: BlurView, blurTintColor: String?) {
    val intValue = blurTintColor?.substring(1)?.let { Integer.parseInt(it, 16) }
    println("hello\n\n")
    println(intValue)
    if (intValue != null) {
      view.setOverlayColor(intValue)
      view.invalidate()
    }
  }
}
