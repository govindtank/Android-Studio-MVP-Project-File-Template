package ${packageName}.di

import android.content.SharedPreferences
import ${packageName}.BuildConfig
import ${packageName}.app.${appName}App
import ${packageName}.data.network.${appName}Service
import ${packageName}.data.preferences.PreferencesManager
import ${packageName}.di.module.NetworkModule.providesApiService
import ${packageName}.di.module.NetworkModule.providesGson
import ${packageName}.di.module.NetworkModule.providesOkHttpCache
import ${packageName}.di.module.NetworkModule.providesOkHttpClient
import ${packageName}.di.module.NetworkModule.providesRetrofit
import ${packageName}.di.module.PreferencesModule.providesPreferencesManager
import ${packageName}.di.module.PreferencesModule.providesSharedPreferences
import com.github.salomonbrys.kodein.Kodein
import com.github.salomonbrys.kodein.bind
import com.github.salomonbrys.kodein.instance
import com.github.salomonbrys.kodein.provider
import com.google.gson.Gson
import okhttp3.Cache
import okhttp3.OkHttpClient
import retrofit2.Retrofit

class KodeinConfig(application: ${appName}App) {

    val kodein = Kodein.Module {

        // Shared preferences binds
        bind<SharedPreferences>() with provider { providesSharedPreferences(instance()) }
        bind<PreferencesManager>() with provider { providesPreferencesManager(instance()) }

        // Network binds
        bind<Cache>() with provider { providesOkHttpCache(application) }
        bind<Gson>() with provider { providesGson() }
        bind<OkHttpClient>() with provider { providesOkHttpClient(instance()) }
        bind<Retrofit>() with provider { providesRetrofit(instance(), instance()) }
        bind<${appName}Service>() with provider { providesApiService(instance()) }
    }
}
