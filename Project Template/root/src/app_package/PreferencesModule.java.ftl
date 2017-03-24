package ${packageName}.di.module;

import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import ${packageName}.app.${appName}App;
import ${packageName}.data.preferences.PreferencesManager;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;

@Module public class PreferencesModule {

    @Provides @Singleton SharedPreferences provideSharedPreferences(${appName}App application) {
        return PreferenceManager.getDefaultSharedPreferences(application);
    }

    @Provides @Singleton PreferencesManager providesPreferencesManager(SharedPreferences prefs) {
	return new PreferencesManager(prefs);
    }
}

