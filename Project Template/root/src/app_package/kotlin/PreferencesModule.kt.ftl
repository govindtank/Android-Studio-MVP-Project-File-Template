package ${packageName}.di.module

import android.content.SharedPreferences
import android.preference.PreferenceManager
import ${packageName}.app.${appName}App
import ${packageName}.data.preferences.PreferencesManager
import dagger.Module
import dagger.Provides
import javax.inject.Singleton

@Module class PreferencesModule {

  @Provides @Singleton  fun provideSharedPreferences(
      application: ${appName}App): SharedPreferences {
    return PreferenceManager.getDefaultSharedPreferences(application)
  }

 @Provides @Singleton fun providePreferencesManager(
      preferences: SharedPreferences): PreferencesManager {
    return PreferencesManager(preferences)
  }
}


