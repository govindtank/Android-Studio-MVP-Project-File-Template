package ${packageName}.di.component

import ${packageName}.di.module.PresenterModule
import ${packageName}.di.scope.PerActivity
import dagger.Subcomponent

@PerActivity @Subcomponent(modules = arrayOf(PresenterModule::class)) interface UiComponent {

  
}


