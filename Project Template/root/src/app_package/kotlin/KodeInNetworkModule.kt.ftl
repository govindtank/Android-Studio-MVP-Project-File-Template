package ${packageName}.di.module

import ${packageName}.BuildConfig
import ${packageName}.app.${appName}App
import ${packageName}.data.network.${appName}Service
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import okhttp3.Cache
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import retrofit2.converter.gson.GsonConverterFactory

object NetworkModule {

    fun providesOkHttpCache(application: ${appName}App): Cache {
        val cacheSize = 10 * 1024 * 1024
        return okhttp3.Cache(application.cacheDir, cacheSize.toLong())
    }

    fun providesGson(): Gson {

        return GsonBuilder().create()
    }

    fun providesOkHttpClient(cache: Cache): OkHttpClient {

        val httpLoggingInterceptor = HttpLoggingInterceptor()
        httpLoggingInterceptor.level = HttpLoggingInterceptor.Level.BODY
        val builder = OkHttpClient.Builder()
        builder.addInterceptor(httpLoggingInterceptor)
        builder.cache(cache)

        return builder.build()
    }

    fun providesRetrofit(gson: Gson, okHttpClient: OkHttpClient): Retrofit {

        return Retrofit.Builder()
                .baseUrl(BuildConfig.REST_API_URL)
                .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
                .addConverterFactory(GsonConverterFactory.create(gson))
                .client(okHttpClient)
                .build()
    }

    fun providesApiService(retrofit: Retrofit): ${appName}Service {
        return retrofit.create(${appName}Service::class.java)
    }

}

