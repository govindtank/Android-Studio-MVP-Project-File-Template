android {

buildTypes{
release {
buildConfigField "String", "REST_API_URL","\"https://api.com/\""
}
debug {
buildConfigField "String", "REST_API_URL","\"https://api.com\""
}
}

<#if generateKotlin>
apply plugin: 'kotlin-android'

apply plugin: 'kotlin-kapt'

apply plugin: 'kotlin-android-extensions'

</#if>
<#if !generateKotlin>
apply plugin: 'com.jakewharton.butterknife'
</#if>
<#if generateKotlin>

sourceSets {
main.java.srcDirs += 'src/main/kotlin'
}
</#if>

}




