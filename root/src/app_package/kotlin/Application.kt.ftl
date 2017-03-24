package ${packageName}.app

import android.app.Application
import ${packageName}.di.component.DaggerMainComponent
import ${packageName}.di.component.MainComponent
import ${packageName}.di.module.ApplicationModule

class ${appName}App : Application() {

  companion object {
    @JvmStatic lateinit var graph: MainComponent
  }

  override fun onCreate() {
    super.onCreate()
    initDagger()
  }

  private fun initDagger() {
    graph = DaggerMainComponent
        .builder()
        .applicationModule(ApplicationModule(this))
        .build()
  }

}


