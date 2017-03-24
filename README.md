# Android-Studio-Dagger-2-File-Template
File template to generate default project structure with Dagger 2, Retrofit, Rx and MVP Pattern.

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
   
# Merged files
- build.gradle (Project)
 * Java
```
    classpath 'com.jakewharton:butterknife-gradle-plugin:8.5.1'
    classpath 'me.tatarka:gradle-retrolambda:3.6.0'
   ```
  * Kotlin
```    
    classpath 'org.jetbrains.kotlin:kotlin-gradle-plugin:1.1.1'
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
    
    compileOptions {
    sourceCompatibility 1.8
    targetCompatibility 1.8
  }
  
  compile 'com.google.dagger:dagger:2.10'
  annotationProcessor 'com.google.dagger:dagger-compiler:2.10'
  provided 'org.glassfish:javax.annotation:10.0-b28'
   
  compile 'io.reactivex:rxandroid:1.2.1'
  compile 'io.reactivex:rxjava:1.2.5'
   
  compile 'com.jakewharton:butterknife:8.5.1'
  annotationProcessor 'com.jakewharton:butterknife-compiler:8.5.1'
   
  compile 'com.squareup.retrofit2:retrofit:2.1.0'
  compile 'com.squareup.retrofit2:converter-gson:2.1.0'
  compile 'com.squareup.retrofit2:adapter-rxjava:2.1.0'
  compile 'com.squareup.okhttp3:okhttp:3.6.0'
  compile 'com.squareup.okhttp3:logging-interceptor:3.6.0'
  compile 'com.squareup.okio:okio:1.11.0'
  
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
  
  compile 'org.jetbrains.kotlin:kotlin-stdlib:1.1.1'
  compile 'org.jetbrains.anko:anko-sdk15:0.9.1'
  
  compile 'com.google.dagger:dagger:2.10'
  kapt 'com.google.dagger:dagger-compiler:2.10'
  provided 'org.glassfish:javax.annotation:10.0-b28'
   
  compile 'io.reactivex:rxandroid:1.2.1'
  compile 'io.reactivex:rxjava:1.2.5'
  
  compile 'com.squareup.retrofit2:retrofit:2.1.0'
  compile 'com.squareup.retrofit2:converter-gson:2.1.0'
  compile 'com.squareup.retrofit2:adapter-rxjava:2.1.0'
  compile 'com.squareup.okhttp3:okhttp:3.6.0'
  compile 'com.squareup.okhttp3:logging-interceptor:3.6.0'
  compile 'com.squareup.okio:okio:1.11.0'
  
  ```

# Usage
You need to copy this folder into the following path:

/ANDROID_STUDIO_HOME/plugins/android/lib/templates/other/

Then it's necessary to restart Android Studio. After that, right-click on app folder and go to:
new -> other -> Project Template

Optionally it's possibly to generate the classes in Kotlin language by checking "Generate files in kotlin".

*** Known issue ***
When merging build.gradle files for add dependencies, you need to fix some generated lines mannualy.
