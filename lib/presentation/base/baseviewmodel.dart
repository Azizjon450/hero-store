abstract class BaseViewModel extends BaseViewModelInputs implements BaseViewModelOutputs{

}

abstract class BaseViewModelInputs{
  void start(); //will be called while init. of view model.
  void dispose(); // will be called when view model dies.
}

abstract class BaseViewModelOutputs{}