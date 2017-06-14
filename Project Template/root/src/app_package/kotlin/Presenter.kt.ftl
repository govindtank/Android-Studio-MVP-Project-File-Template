package ${packageName}.ui.core

import io.reactivex.disposables.CompositeDisposable
import io.reactivex.disposables.Disposable

open class MvpPresenter<T : BaseView> : BasePresenter<T> {

protected var view: T? = null
protected var compositeDisposable: CompositeDisposable? = null

    override fun attach(view: T) {
        this.view = view
        compositeDisposable = CompositeDisposable()
    }

    override fun detach() {
        this.view = null
        compositeDisposable?.dispose()
    }

    protected fun addDisposable(disposable: Disposable) {
        compositeDisposable?.add(disposable)
    }
}