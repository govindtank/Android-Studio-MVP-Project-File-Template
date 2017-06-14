buildscript {
  ext.KOTLIN_VERSION = '1.1.2-3'
  ext.ANKO_VERSION = '0.9.1'

  repositories {
    jcenter()
}
dependencies {
<#if language == "kotlin">
classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$KOTLIN_VERSION"
</#if>
}
}




