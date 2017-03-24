package ${packageName}.di.module

import android.content.Context
import ${packageName}.app.${appName}App
import dagger.Module
import dagger.Provides
import javax.inject.Singleton

@Module class ApplicationModule(private val application: ${appName}App) {

  @Provides @Singleton  fun provideApplication(): ${appName}App {
    return application
  }

  @Provides @Singleton  fun provideContext(): Context {
    return application
  }
}
