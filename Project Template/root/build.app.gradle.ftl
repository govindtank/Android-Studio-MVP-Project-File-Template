android {

buildTypes{
release {
buildConfigField "String", "REST_API_URL","\"https://api.com/\""
}
debug {
buildConfigField "String", "REST_API_URL","\"https://api.com\""
}
}

<#if language == "kotlin">
apply plugin: 'kotlin-android'
apply plugin: 'kotlin-kapt'
apply plugin: 'kotlin-android-extensions'

sourceSets {
main.java.srcDirs += 'src/main/kotlin'
}
</#if>
<#if language == "java">
apply plugin: 'com.jakewharton.butterknife'
</#if>
}




