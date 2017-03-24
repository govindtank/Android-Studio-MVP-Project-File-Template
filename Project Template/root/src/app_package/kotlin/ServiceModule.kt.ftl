package ${packageName}.di.module

import ${packageName}.data.network.${appName}Service
import dagger.Module
import dagger.Provides
import retrofit2.Retrofit
import javax.inject.Singleton

@Module class ServiceModule {

  @Provides @Singleton internal fun providesApiService(retrofit: Retrofit): ${appName}Service {
    return retrofit.create(${appName}Service::class.java)
  }
}


