package ${packageName}.ui.core;

import android.app.ProgressDialog;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import ${packageName}.R;
import ${packageName}.app.${appName}App;
import ${packageName}.di.component.UiComponent;

public class BaseActivity extends AppCompatActivity {

    private UiComponent component;

    @Override protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        initUiComponent();
    }

    private void initUiComponent() {
        component = ${appName}App.getGraph().uiComponent();
    }

    protected void setupToolbar() {
        //Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        //setSupportActionBar(toolbar);
        ActionBar ab = getSupportActionBar();

        if (ab != null) {
            ab.setDisplayHomeAsUpEnabled(true);
            ab.setHomeButtonEnabled(true);
        }
    }

    protected ProgressDialog getDefaultProgress() {
 	ProgressDialog progressDialog = new ProgressDialog(this);
        progressDialog.setMessage(getString(R.string.loading_message));
        progressDialog.setCancelable(false);
        return progressDialog;
    }

    protected UiComponent getUiComponent() {
        return component;
    }
}

