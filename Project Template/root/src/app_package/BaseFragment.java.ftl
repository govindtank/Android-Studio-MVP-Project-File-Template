package ${packageName}.ui.core;

import android.app.ProgressDialog;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.widget.Toast;
import ${packageName}.app.${appName}App;
import ${packageName}.di.component.UiComponent;
import ${packageName}.R;

public class BaseFragment extends Fragment implements BaseView {

  protected UiComponent uiComponent;
  protected ProgressDialog progress;

  @Override public void onCreate(@Nullable Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    initUiComponent();
    setupProgressDialog();
  }

  private void initUiComponent() {
    uiComponent = ${appName}App.getMainComponent().uiComponent();
  }

  private void setupProgressDialog() {
    progress = new ProgressDialog(getActivity());
    progress.setMessage((getString(R.string.loading_message)));
    progress.setCancelable(false);
  }

  @Override public void showProgress() {
    if (isAdded() && progress != null && !progress.isShowing()) progress.show();
  }

  @Override public void hideProgress() {
    if (isAdded() && progress != null && progress.isShowing()) progress.dismiss();
  }

  @Override public void showMessage(String message) {
    if (isAdded()) Toast.makeText(getActivity(), message, Toast.LENGTH_SHORT).show();
  }

}


