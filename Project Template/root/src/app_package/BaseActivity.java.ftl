package ${packageName}.ui.core;

import android.app.ProgressDialog;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.NavigationView;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.widget.Toast;
import ${packageName}.R;
import ${packageName}.app.${appName}App;
import ${packageName}.di.component.UiComponent;

public class BaseActivity extends AppCompatActivity implements BaseView {

  protected UiComponent uiComponent;
  protected ProgressDialog progress;

  private ActionBarDrawerToggle drawerToggle;

  @Override protected void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    initUiComponent();
    setupProgressDialog();
  }

  private void initUiComponent() {
    uiComponent = ${appName}App.getMainComponent().uiComponent();
  }

  protected void setupToolbar() {
    Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
    setSupportActionBar(toolbar);
    ActionBar ab = getSupportActionBar();

    if (ab != null) {
      ab.setDisplayHomeAsUpEnabled(true);
      ab.setHomeButtonEnabled(true);
    }
  }

  protected void setupDrawer() {

    DrawerLayout drawerLayout = (DrawerLayout) findViewById(R.id.drawer_layout);
    NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);

    navigationView.setNavigationItemSelectedListener(item -> {

      switch (item.getItemId()) {

        default:
          return false;
      }
    });

    drawerToggle = new ActionBarDrawerToggle(this, drawerLayout, R.string.drawer_open,
        R.string.drawer_closed) {

      public void onDrawerClosed(View view) {
        super.onDrawerClosed(view);
        invalidateOptionsMenu(); // creates call to onPrepareOptionsMenu()
      }

      public void onDrawerOpened(View drawerView) {
        super.onDrawerOpened(drawerView);
        invalidateOptionsMenu(); // creates call to onPrepareOptionsMenu()
      }
    };

    drawerLayout.addDrawerListener(drawerToggle);
    drawerToggle.syncState();
  }

  private void setupProgressDialog() {
    progress = new ProgressDialog(this);
    progress.setMessage((getString(R.string.loading_message)));
    progress.setCancelable(false);
  }

  @Override public boolean onOptionsItemSelected(MenuItem item) {

    if (drawerToggle != null) {
      return drawerToggle.onOptionsItemSelected(item);
    }

    switch (item.getItemId()) {

      case android.R.id.home:
        onBackPressed();
        return true;
    }

    return super.onOptionsItemSelected(item);
  }

  @Override public void showProgress() {
    if (progress != null && !progress.isShowing()) progress.show();
  }

  @Override public void hideProgress() {
    if (progress != null && progress.isShowing()) progress.dismiss();
  }

  @Override public void showMessage(String message) {
    Toast.makeText(this, message, Toast.LENGTH_SHORT).show();
  }
}