package ${packageName}.ui.core

interface BasePresenter<in T> where T : BaseView {

  fun attach(view: T)
  fun detach()

}

