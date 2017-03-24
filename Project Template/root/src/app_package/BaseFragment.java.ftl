package ${packageName}.ui.core;

import android.app.ProgressDialog;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import ${packageName}.app.${appName}App;
import ${packageName}.di.component.UiComponent;
import ${packageName}.R;

public class BaseFragment extends Fragment {

    private UiComponent component;

    @Override public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        initUiComponent();
    }

    private void initUiComponent() {
        component = ${appName}App.getGraph().uiComponent();
    }

    protected UiComponent getUiComponent() {
        return component;
    }

    protected ProgressDialog getDefaultProgress() {
        ProgressDialog progressDialog = new ProgressDialog(getActivity());
       	progressDialog.setMessage(getString(R.string.loading_message));
        progressDialog.setCancelable(false);
        return progressDialog;
    }
}

