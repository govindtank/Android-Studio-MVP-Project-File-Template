package ${packageName}.di.module

import ${packageName}.BuildConfig
import ${packageName}.app.${appName}App
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import dagger.Module
import dagger.Provides
import okhttp3.Cache
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.adapter.rxjava.RxJavaCallAdapterFactory
import retrofit2.converter.gson.GsonConverterFactory
import javax.inject.Singleton

@Module class NetworkModule {

  @Provides @Singleton fun provideOkHttpCache(application: ${appName}App): Cache {
    val cacheSize = 10 * 1024 * 1024
    return Cache(application.cacheDir, cacheSize.toLong())
  }

  @Provides @Singleton fun provideGson(): Gson {
    val gsonBuilder = GsonBuilder()
    return gsonBuilder.create()
  }

  @Provides @Singleton fun provideOkHttpClient(cache: Cache): OkHttpClient {

    val httpLoggingInterceptor = HttpLoggingInterceptor()
    httpLoggingInterceptor.level = HttpLoggingInterceptor.Level.BODY
    val builder = OkHttpClient.Builder()
    builder.addInterceptor(httpLoggingInterceptor)
    builder.cache(cache)

    return builder.build()
  }

  @Provides @Singleton fun provideRetrofit(gson: Gson,
      okHttpClient: OkHttpClient): Retrofit {

    return Retrofit.Builder().baseUrl(BuildConfig.REST_API_URL)
        .addCallAdapterFactory(RxJavaCallAdapterFactory.create())
        .addConverterFactory(GsonConverterFactory.create(gson))
        .client(okHttpClient)
        .build()
  }
}


