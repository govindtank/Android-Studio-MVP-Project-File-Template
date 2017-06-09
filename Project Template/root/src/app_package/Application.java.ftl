package ${packageName}.app;

import android.app.Application;
import ${packageName}.di.component.DaggerMainComponent;
import ${packageName}.di.component.MainComponent;
import ${packageName}.di.module.ApplicationModule;

public class ${appName}App extends Application {

    private static MainComponent mainComponent;

    public static MainComponent getMainComponent() {
        return mainComponent;
    }

    @Override public void onCreate() {
        super.onCreate();
        initDagger();
    }

    private void initDagger() {
        mainComponent =  DaggerMainComponent
			.builder()
			.applicationModule(new ApplicationModule(this))
			.build();
    }
}

