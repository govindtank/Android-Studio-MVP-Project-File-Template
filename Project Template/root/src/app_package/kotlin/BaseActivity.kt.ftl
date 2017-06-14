package ${packageName}.ui.core

import android.app.ProgressDialog
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.support.design.widget.NavigationView
import android.support.v4.widget.DrawerLayout
import android.support.v7.app.ActionBarDrawerToggle
import android.support.v7.widget.Toolbar
import org.jetbrains.anko.toast
import ${packageName}.R
<#if di == "dagger">
import ${packageName}.di.component.UiComponent
import ${packageName}.app.${appName}App
</#if>
<#if di == "kodein">
import com.github.salomonbrys.kodein.KodeinInjected
import com.github.salomonbrys.kodein.KodeinInjector
import com.github.salomonbrys.kodein.android.appKodein
</#if>

open class BaseActivity : AppCompatActivity(), BaseView <#if di == "kodein">, KodeinInjected </#if> {

    <#if di == "kodein">
    override val injector = KodeinInjector()
    </#if>
    <#if di == "dagger">
    protected lateinit var uiComponent: UiComponent
    </#if>
    protected var progress: ProgressDialog? = null
    private var drawerLayout: DrawerLayout? = null
    private var drawerToggle: ActionBarDrawerToggle? = null
    private var navigationView: NavigationView? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        <#if di == "kodein">
        inject(appKodein())
        </#if>
        <#if di == "dagger">
        initUiComponent()
        </#if>
        setupProgressDialog()
    }
    <#if di == "dagger">

    private fun initUiComponent() {
        uiComponent = ${appName}App.mainComponent.uiComponent()
    }
    </#if>

    protected fun setupToolbar() {
        val toolbar = findViewById(R.id.toolbar) as Toolbar
        setSupportActionBar(toolbar)
        val ab = supportActionBar

        if (ab != null) {
            ab.setDisplayHomeAsUpEnabled(true)
            ab.setHomeButtonEnabled(true)
        }
    }

    protected fun setupDrawer() {
        drawerLayout = findViewById(R.id.drawer_layout) as DrawerLayout
        navigationView = findViewById(R.id.nav_view) as NavigationView

        navigationView!!.setNavigationItemSelectedListener {

            when (it.itemId) {

            }
            return@setNavigationItemSelectedListener true
        }

        drawerToggle = object : ActionBarDrawerToggle(this@BaseActivity, drawerLayout,
                R.string.drawer_open,
                R.string.drawer_closed) {

            override fun onDrawerOpened(drawerView: View?) {
                super.onDrawerOpened(drawerView)
                invalidateOptionsMenu()
            }

            override fun onDrawerClosed(drawerView: View?) {
                super.onDrawerClosed(drawerView)
                invalidateOptionsMenu()
            }
        }

        drawerLayout!!.addDrawerListener(drawerToggle!!)
        drawerToggle!!.syncState()
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {

        if (drawerToggle != null) return drawerToggle!!.onOptionsItemSelected(item)

        when (item.itemId) {
            android.R.id.home -> {
                onBackPressed()
                return true
            }
        }
        return super.onOptionsItemSelected(item)
    }

    private fun setupProgressDialog() {
        progress = ProgressDialog(this)
        progress?.setMessage(getString(R.string.loading_message))
        progress?.setCancelable(false)
    }

    override fun showProgress() {
        progress?.show()
    }

    override fun hideProgress() {
        progress?.dismiss()
    }

    override fun showMessage(message: Any) {
        when(message) {
            is String -> toast(message)
            is Int -> toast(getString(message))
        }
    }
}

