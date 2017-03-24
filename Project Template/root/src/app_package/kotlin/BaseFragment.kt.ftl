package ${packageName}.ui.core

import android.app.ProgressDialog
import android.os.Bundle
import android.support.v4.app.Fragment
import ${packageName}.R
import ${packageName}.app.${appName}App
import ${packageName}.di.component.UiComponent

open class BaseFragment : Fragment() {

  protected lateinit var uiComponent: UiComponent

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    initUiComponent()
  }

  private fun initUiComponent() {
    uiComponent = ${appName}App.graph.uiComponent()
  }

  protected val getDefaultProgress: ProgressDialog
    get() {
      val progressDialog = ProgressDialog(activity)
      progressDialog.setMessage(getString(R.string.loading_message))
      progressDialog.setCancelable(false)
      return progressDialog
    }
}


