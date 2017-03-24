package ${packageName}.di.module;

import ${packageName}.data.network.${appName}Service;
import dagger.Module;
import dagger.Provides;
import javax.inject.Singleton;
import retrofit2.Retrofit;

@Module public class ServiceModule {

    @Provides @Singleton ${appName}Service providesApiService(Retrofit retrofit) {
        return retrofit.create(${appName}Service.class);
    }
}

