package ${packageName}.app;

import android.app.Application;
import ${packageName}.di.component.DaggerMainComponent;
import ${packageName}.di.component.MainComponent;
import ${packageName}.di.module.ApplicationModule;

public class ${appName}App extends Application {

    private static MainComponent graph;

    public static MainComponent getGraph() {
        return graph;
    }

    @Override public void onCreate() {
        super.onCreate();
        initDagger();
    }

    private void initDagger() {
        graph =
            DaggerMainComponent.builder().applicationModule(new ApplicationModule(this)).build();
    }
}

