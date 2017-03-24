package ${packageName}.ui.core

import android.app.ProgressDialog
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import ${packageName}.R
import ${packageName}.app.${appName}App
import ${packageName}.di.component.UiComponent

open class BaseActivity : AppCompatActivity() {

  protected lateinit var uiComponent: UiComponent

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    initUiComponent()
  }

  private fun initUiComponent() {
    uiComponent = ${appName}App.graph.uiComponent()
  }

  protected fun setupToolbar() {
    //val toolbar = findViewById(R.id.toolbar) as Toolbar
    //setSupportActionBar(toolbar)
    val ab = supportActionBar

    if (ab != null) {
      ab.setDisplayHomeAsUpEnabled(true)
      ab.setHomeButtonEnabled(true)
    }
  }

  protected val getDefaultProgress: ProgressDialog
    get() {
      val progressDialog = ProgressDialog(this)
      progressDialog.setMessage(getString(R.string.loading_message))
      progressDialog.setCancelable(false)
      return progressDialog
    }
}


