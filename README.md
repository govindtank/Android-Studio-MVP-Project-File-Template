# Android-Studio-MVP-Project-File-Template
File template to generate default project structure with MVP Pattern and RxJava.

* You may use this template combined with [MVP Template](https://github.com/lucasmodesto/Android-Studio-MVP-File-Template) for generating MVP classes.

# Template files
- Application 
  - Generates application class with dagger main component initialization.
  
- Modules
  - ApplicationModule - Provides application instance / context
  - NetworkModule - Provides Retrofit / OkHttp instances
  - PreferencesModule - Provides default SharedPreferences and Preferences Helper instances.
  - ServiceModule - Provides retrofit service instance
  - PresenterModule - Provides presenter's instances under activity scope
   
- Component
  - MainComponent - Dagger main component
  - UiComponent - Sub component with scope based on views lifecycle.
  
 - Scope
   - PerActivity - Scope that rely on activity's life cycle
   
 - MVP Core
   - BaseActivity - Default BaseActivity
   - BaseFragment - Default BaseFragment
   - BaseView - Interface that contains default functions for View classes.
   - BasePresenter - Interface that contains default functions for Presenter classes.
   - Presenter - Class that implements view attach/detach and RxJava subscriptions functions 
   
# Merged files
- build.gradle (Project)
 * Java
```
    classpath 'com.jakewharton:butterknife-gradle-plugin:8.6.0'
   ```
  * Kotlin
```    
    classpath 'org.jetbrains.kotlin:kotlin-gradle-plugin:1.1.2-5'
```
  
 - build.gradle (App)
  * Java
 ```
   apply plugin: 'me.tatarka.retrolambda'
   apply plugin: 'com.jakewharton.butterknife'
   
   release {
    buildConfigField "String", "REST_API_URL","\"https://api.com/\""
    }

    debug {
      buildConfigField "String", "REST_API_URL","\"https://api.com\""
    }
  
  // Dependency injection
  compile 'com.google.dagger:dagger:2.10'
  annotationProcessor 'com.google.dagger:dagger-compiler:2.10'
   
  // RxJava
  compile 'io.reactivex.rxjava2:rxandroid:2.0.1'
  compile 'io.reactivex.rxjava2:rxjava:2.1.0'
  compile 'io.reactivex.rxjava2:rxkotlin:2.0.2'

  compile 'com.jakewharton:butterknife:8.6.0'
  annotationProcessor 'com.jakewharton:butterknife-compiler:8.6.0'
   
  compile 'com.squareup.retrofit2:retrofit:2.2.0'
  compile 'com.squareup.retrofit2:converter-gson:2.2.0'
  compile 'com.squareup.retrofit2:adapter-rxjava:2.2.0'
  compile 'com.squareup.okhttp3:okhttp:3.7.0'
  compile 'com.squareup.okhttp3:logging-interceptor:3.7.0'
  compile 'com.squareup.okio:okio:1.12.0'

  compile 'com.jakewharton.timber:timber:4.5.1'
  
```
  * Kotlin
```  
  apply plugin: 'kotlin-android'
  apply plugin: 'kotlin-kapt'
  apply plugin: 'kotlin-android-extensions'
  
   release {
    buildConfigField "String", "REST_API_URL","\"https://api.com/\""
    }

    debug {
      buildConfigField "String", "REST_API_URL","\"https://api.com\""
    }
  
  kapt {
    generateStubs = true
  }
  
  sourceSets {
    main.java.srcDirs += 'src/main/kotlin'
  }
   
  compile "org.jetbrains.kotlin:kotlin-stdlib:$KOTLIN_VERSION"
  compile "org.jetbrains.anko:anko-sdk15:$ANKO_VERSION"
  
  // Dependency injection
  compile "com.github.salomonbrys.kodein:kodein:$KODEIN_VERSION"
  compile "com.github.salomonbrys.kodein:kodein-android:$KODEIN_VERSION"
  // or     
  compile 'com.google.dagger:dagger:2.10'
  kapt 'com.google.dagger:dagger-compiler:2.10'
   
  // RxJava
  compile 'io.reactivex.rxjava2:rxandroid:2.0.1'
  compile 'io.reactivex.rxjava2:rxjava:2.1.0'
  compile 'io.reactivex.rxjava2:rxkotlin:2.0.2'
   
  compile 'com.squareup.retrofit2:retrofit:2.2.0'
  compile 'com.squareup.retrofit2:converter-gson:2.2.0'
  compile 'com.squareup.retrofit2:adapter-rxjava:2.2.0'
  compile 'com.squareup.okhttp3:okhttp:3.7.0'
  compile 'com.squareup.okhttp3:logging-interceptor:3.7.0'
  compile 'com.squareup.okio:okio:1.12.0'

  compile 'com.jakewharton.timber:timber:4.5.1'
  
  ```
# Usage
You need to copy "Project Template" folder into the following path:

```
/ANDROID_STUDIO_HOME/plugins/android/lib/templates/other/
```

Then it's necessary to restart Android Studio. After that, right-click on app folder and go to:
new -> other -> Project Template

*** Known issue ***
When merging build.gradle files for add dependencies, you need to fix some generated lines mannualy.
