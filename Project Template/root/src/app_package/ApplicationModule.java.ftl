package ${packageName}.di.module;

import android.content.Context;
import android.content.SharedPreferences;
import dagger.Module;
import ${packageName}.app.${appName}App;
import dagger.Provides;
import javax.inject.Singleton;

@Module public class ApplicationModule {

    private ${appName}App mApplication;

    public ApplicationModule(${appName}App mApplication) {
        this.mApplication = mApplication;
    }

    @Provides @Singleton ${appName}App provideApplication() {
        return mApplication;
    }

    @Provides @Singleton Context provideContext() {
        return mApplication;
    }
}

