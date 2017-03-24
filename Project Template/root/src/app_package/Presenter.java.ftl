package ${packageName}.ui.core;

import rx.subscriptions.CompositeSubscription;
import rx.Subscription;

public class Presenter<T extends BaseView> implements BasePresenter<T> {

    protected T view;
    protected CompositeSubscription subscriptions;

    @Override public void attach(T view) {
        this.view = view;
        subscriptions = new CompositeSubscription();
    }

    @Override public void detach() {
        this.view = null;
        if (subscriptions != null) subscriptions.clear();
    }

    protected void addSubscription(Subscription subscription) {
        if (subscriptions != null) subscriptions.add(subscription);
    }
}

