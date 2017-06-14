package ${packageName}.ui.core;

import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;

public class MvpPresenter<T extends BaseView> implements BasePresenter<T> {

    protected T view;
    protected CompositeDisposable compositeDisposable;

    @Override public void attach(T view) {
        this.view = view;
        compositeDisposable = new CompositeDisposable();
    }

    @Override public void detach() {
        this.view = null;
        if (compositeDisposable != null) compositeDisposable.dispose();
    }

    protected void addDisposable(Disposable disposable){
        if (compositeDisposable != null) compositeDisposable.add(disposable);
    }
}

