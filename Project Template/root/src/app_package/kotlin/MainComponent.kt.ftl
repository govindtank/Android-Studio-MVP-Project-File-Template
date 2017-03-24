package ${packageName}.di.component

import ${packageName}.di.module.ApplicationModule
import ${packageName}.di.module.PreferencesModule
import ${packageName}.di.module.NetworkModule
import ${packageName}.di.module.ServiceModule
import dagger.Component
import javax.inject.Singleton

@Singleton
@Component(modules = arrayOf(ApplicationModule::class, NetworkModule::class, ServiceModule::class,
    PreferencesModule::class))
interface MainComponent {

  fun uiComponent(): UiComponent
}


