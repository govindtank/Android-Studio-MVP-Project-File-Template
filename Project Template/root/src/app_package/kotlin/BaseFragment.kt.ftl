package ${packageName}.ui.core

import android.app.ProgressDialog
import android.os.Bundle
import android.support.v4.app.Fragment
import android.widget.Toast
import ${packageName}.R
import ${packageName}.app.${appName}App
import ${packageName}.di.component.UiComponent

open class BaseFragment : Fragment(), BaseView {

  protected lateinit var uiComponent: UiComponent
  protected var progress: ProgressDialog? = null

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    initUiComponent()
    setupProgressDialog()
  }

  private fun initUiComponent() {
    uiComponent = ${appName}App.mainComponent.uiComponent()
  }

   private fun setupProgressDialog() {
        progress = ProgressDialog(activity)
        progress!!.setMessage(getString(R.string.loading_message))
        progress!!.setCancelable(false)
  }

  override fun showProgress() {
        if (isAdded) progress?.show()
  }

  override fun hideProgress() {
        if (isAdded) progress?.dismiss()
  }

 override fun showMessage(message: Any) {
        when (message) {
            is String -> Toast.makeText(activity, message, Toast.LENGTH_SHORT).show()
            is Int -> Toast.makeText(activity, getString(message), Toast.LENGTH_SHORT).show()
        }
    }
	
}


