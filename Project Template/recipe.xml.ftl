<?xml version="1.0"?>
<recipe>

	<#if generateKotlin>

	<instantiate from="src/app_package/kotlin/MainComponent.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/component/MainComponent.kt" />

	<instantiate from="src/app_package/kotlin/UiComponent.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/component/UiComponent.kt" />

	<instantiate from="src/app_package/kotlin/ApplicationModule.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/module/ApplicationModule.kt" />

	<instantiate from="src/app_package/kotlin/NetworkModule.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/module/NetworkModule.kt" />

	<instantiate from="src/app_package/kotlin/ServiceModule.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/module/ServiceModule.kt" />

	<instantiate from="src/app_package/kotlin/Service.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/data/network/${appName}Service.kt" />

	<instantiate from="src/app_package/kotlin/Application.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/app/${appName}App.kt" />

	<instantiate from="src/app_package/PerActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/scope/PerActivity.java" />

	<instantiate from="src/app_package/kotlin/PreferencesModule.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/module/PreferencesModule.kt" />


	<instantiate from="src/app_package/kotlin/PresenterModule.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/module/PresenterModule.kt" />

	<instantiate from="src/app_package/kotlin/PreferencesManager.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/data/preferences/PreferencesManager.kt" />

 <dependency mavenUrl="org.jetbrains.kotlin:kotlin-stdlib:1.1.1"/>
 <dependency mavenUrl="org.jetbrains.anko:anko-sdk15:0.9.1"/>

	</#if>	

	<#if !generateKotlin>
 
	<instantiate from="src/app_package/MainComponent.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/component/MainComponent.java" />

	<instantiate from="src/app_package/UiComponent.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/component/UiComponent.java" />

	<instantiate from="src/app_package/ApplicationModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/module/ApplicationModule.java" />

	<instantiate from="src/app_package/NetworkModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/module/NetworkModule.java" />

	<instantiate from="src/app_package/ServiceModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/module/ServiceModule.java" />

	<instantiate from="src/app_package/Service.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/data/network/${appName}Service.java" />

	<instantiate from="src/app_package/Application.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/app/${appName}App.java" />

	<instantiate from="src/app_package/PerActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/scope/PerActivity.java" />

	<instantiate from="src/app_package/PreferencesModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/module/PreferencesModule.java" />


	<instantiate from="src/app_package/PresenterModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/module/PresenterModule.java" />

	<instantiate from="src/app_package/PreferencesManager.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/data/preferences/PreferencesManager.java" />


<dependency mavenUrl="com.jakewharton:butterknife:8.5.1"/>
<dependency mavenUrl="com.jakewharton:butterknife-compiler:8.5.1" gradleConfiguration="annotationProcessor"/>

</#if>

 <dependency mavenUrl="com.google.dagger:dagger:2.10"/>
 <dependency mavenUrl="com.google.dagger:dagger-compiler:2.10" gradleConfiguration="annotationProcessor" />
 <dependency mavenUrl="org.glassfish:javax.annotation:10.0-b28" gradleConfiguration="provided" />


<dependency mavenUrl="io.reactivex:rxandroid:1.2.1"/>
<dependency mavenUrl="io.reactivex:rxjava:1.2.5"/>

<dependency mavenUrl="com.squareup.retrofit2:retrofit:2.1.0"/>
<dependency mavenUrl="com.squareup.retrofit2:converter-gson:2.1.0"/>
<dependency mavenUrl="com.squareup.retrofit2:adapter-rxjava:2.1.0"/>
<dependency mavenUrl="com.squareup.okhttp3:okhttp:3.6.0"/>
<dependency mavenUrl="com.squareup.okhttp3:logging-interceptor:3.6.0"/>
<dependency mavenUrl="com.squareup.okio:okio:1.11.0"/>

	<merge from="/build.app.gradle.ftl"
		to="${escapeXmlAttribute(topOut)}/${projectName}/build.gradle"/>
	
	<merge from="/build.project.gradle.ftl"
	to="${escapeXmlAttribute(topOut)}/build.gradle"/>

</recipe>
