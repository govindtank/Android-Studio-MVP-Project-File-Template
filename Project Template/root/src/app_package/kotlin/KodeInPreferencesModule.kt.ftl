package ${packageName}.di.module

import android.content.Context
import android.content.SharedPreferences
import ${packageName}.data.preferences.PreferencesManager

object PreferencesModule {

    fun providesSharedPreferences(context: Context) : SharedPreferences {
        return context.getSharedPreferences("${appName}Preferences", Context.MODE_PRIVATE)
    }

    fun providesPreferencesManager(sharedPreferences: SharedPreferences) : PreferencesManager {
        return PreferencesManager(sharedPreferences)
    }
}
