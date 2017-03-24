package ${packageName}.ui.core

import rx.subscriptions.CompositeSubscription
import rx.Subscription

open class Presenter<T : BaseView> : BasePresenter<T> {

  private var _view: T? = null
  private var compositeSubscription: CompositeSubscription? = null

  protected val view: T?
    get() {
      return _view
    }

  protected val subscriptions: CompositeSubscription?
    get() {
      return compositeSubscription
    }

  override fun attach(view: T) {
    _view = view
    compositeSubscription = CompositeSubscription()
  }

  override fun detach() {
    _view = null
    compositeSubscription?.clear()
  }

  protected fun addSubscription(subscription: Subscription) {
    subscriptions?.add(subscription)
  }

}
