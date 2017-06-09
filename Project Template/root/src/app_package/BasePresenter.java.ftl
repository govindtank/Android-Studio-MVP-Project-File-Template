package ${packageName}.ui.core;

public interface BasePresenter<T extends BaseView> {

    void attach(T view);
    void detach();

}
