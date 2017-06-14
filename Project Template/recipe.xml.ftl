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

	<instantiate from="src/app_package/kotlin/BaseActivity.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/core/BaseActivity.kt" />
	<instantiate from="src/app_package/kotlin/BaseView.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/core/BaseView.kt" />
	<instantiate from="src/app_package/kotlin/BasePresenter.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/core/BasePresenter.kt" />

	<instantiate from="src/app_package/kotlin/BaseFragment.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/core/BaseFragment.kt" />

	<instantiate from="src/app_package/kotlin/Presenter.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/core/MvpPresenter.kt" />




<dependency mavenUrl="io.reactivex.rxjava2:rxkotlin:2.0.2"/>
<dependency mavenUrl="org.jetbrains.kotlin:kotlin-stdlib:1.1.2-3"/>
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

	<instantiate from="src/app_package/BaseActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/core/BaseActivity.java" />
	<instantiate from="src/app_package/BaseView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/core/BaseView.java" />
	<instantiate from="src/app_package/BasePresenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/core/BasePresenter.java" />

	<instantiate from="src/app_package/BaseFragment.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/core/BaseFragment.java" />

	<instantiate from="src/app_package/Presenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/ui/core/MvpPresenter.java" />


<dependency mavenUrl="com.jakewharton:butterknife:8.6.0"/>
<dependency mavenUrl="com.jakewharton:butterknife-compiler:8.6.0" gradleConfiguration="annotationProcessor"/>

</#if>

<dependency mavenUrl="com.google.dagger:dagger:2.10"/>
<dependency mavenUrl="com.google.dagger:dagger-compiler:2.10" gradleConfiguration="annotationProcessor" />




<dependency mavenUrl="io.reactivex.rxjava2:rxandroid:2.0.1"/>
<dependency mavenUrl="io.reactivex.rxjava2:rxjava:2.1.0"/>


<dependency mavenUrl="com.squareup.retrofit2:retrofit:2.2.0"/>
<dependency mavenUrl="com.squareup.retrofit2:converter-gson:2.2.0"/>
<dependency mavenUrl="com.squareup.retrofit2:adapter-rxjava:2.2.0"/>
<dependency mavenUrl="com.squareup.okhttp3:okhttp:3.7.0"/>
<dependency mavenUrl="com.squareup.okhttp3:logging-interceptor:3.7.0"/>
<dependency mavenUrl="com.squareup.okio:okio:1.12.0"/>

	<merge from="build.app.gradle.ftl"
		to="${escapeXmlAttribute(topOut)}/${projectName}/build.gradle"/>
	
	<merge from="build.project.gradle.ftl"
	to="${escapeXmlAttribute(topOut)}/build.gradle"/>

	<merge from="strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

</recipe>
