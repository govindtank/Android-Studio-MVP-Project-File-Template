buildscript {
  repositories {
    jcenter()
}
dependencies {
<#if !generateKotlin>
classpath 'com.jakewharton:butterknife-gradle-plugin:8.5.1'
classpath 'me.tatarka:gradle-retrolambda:3.6.0'
</#if>
<#if generateKotlin>
classpath 'org.jetbrains.kotlin:kotlin-gradle-plugin:1.1.1'
</#if>
}
}




