package ${packageName}.ui.core

import android.app.ProgressDialog
import android.os.Bundle
import android.support.v4.app.Fragment
import android.widget.Toast
import ${packageName}.R
<#if di == "dagger">
import ${packageName}.app.${appName}App
import ${packageName}.di.component.UiComponent
</#if>
<#if di == "kodein">
import com.github.salomonbrys.kodein.KodeinInjected
import com.github.salomonbrys.kodein.KodeinInjector
import com.github.salomonbrys.kodein.android.appKodein
</#if>

open class BaseFragment : Fragment(), BaseView <#if di == "kodein">, KodeinInjected </#if>{

  <#if di == "kodein">
  override val injector = KodeinInjector()
  </#if>
  <#if di == "dagger">
  protected lateinit var uiComponent: UiComponent
  </#if>
  protected var progress: ProgressDialog? = null

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
     <#if di == "kodein">
    inject(appKodein())
        </#if>
        <#if di == "dagger">
    initUiComponent()
        </#if>
    setupProgressDialog()
  }
  <#if di == "dagger">

  private fun initUiComponent() {
    uiComponent = ${appName}App.mainComponent.uiComponent()
  }

</#if>
   private fun setupProgressDialog() {
        progress = ProgressDialog(activity)
        progress?.setMessage(getString(R.string.loading_message))
        progress?.setCancelable(false)
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


