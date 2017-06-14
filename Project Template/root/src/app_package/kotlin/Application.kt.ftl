package ${packageName}.app

import android.app.Application
import timber.log.Timber
import ${packageName}.BuildConfig
<#if di == "dagger">
import ${packageName}.di.component.DaggerMainComponent
import ${packageName}.di.component.MainComponent
import ${packageName}.di.module.ApplicationModule
</#if>
<#if di == "kodein">
import com.github.salomonbrys.kodein.Kodein
import com.github.salomonbrys.kodein.KodeinAware
import com.github.salomonbrys.kodein.lazy
import ${packageName}.di.KodeinConfig
</#if>

class ${appName}App : Application()<#if di == "kodein">, KodeinAware </#if> {

<#if di == "dagger">
  companion object {
    @JvmStatic lateinit var mainComponent: MainComponent
  }
</#if>
<#if di == "kodein">
    override val kodein by Kodein.lazy {
        import(KodeinConfig(this@${appName}App).kodein)
    }
</#if>

  override fun onCreate() {
    super.onCreate()
<#if di == "dagger">
    initDagger()
</#if>
    if (BuildConfig.DEBUG) {
            Timber.plant(Timber.DebugTree())
        }
  }

<#if di == "dagger">
  private fun initDagger() {
    mainComponent = DaggerMainComponent
        .builder()
        .applicationModule(ApplicationModule(this))
        .build()
  }
</#if>

}


