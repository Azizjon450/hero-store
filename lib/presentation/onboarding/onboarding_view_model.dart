import 'dart:async';

import '../../domain/model.dart';
import '../base/baseviewmodel.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    implements OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //stream controllers
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  late final List<SliderObject> _list;

  int _currentIndex = 0;

  //inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    //send slider data to our view
    _postdataToView();
  }

  @override
  int goNext() {
    int nextIndex = _currentIndex++; //+1
    if (nextIndex >= _list.length) {
      _currentIndex = 0; //infinite loop to go to first item inside the slider
    }
    return _currentIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex--; //-1
    if (previousIndex == -1) {
      _currentIndex =
          _list.length - 1; //infinite loop to go to the length of slider list
    }
    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postdataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  //outputs
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  //private functions
  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onboardinglogo1),
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle2, ImageAssets.onboardinglogo2),
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle3, ImageAssets.onboardinglogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle1, ImageAssets.onboardinglogo4),
      ];
  _postdataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

//inputs mean the order that our view model will recieve from our view
abstract class OnBoardingViewModelInputs {
  void goNext(); //when user clicks Right arrow or swipe Left
  void goPrevious(); //when user clicks Left arrow or swipe Right
  void onPageChanged(int index);

  Sink
      get inputSliderViewObject; //this is the way to add data to the stream..stream input
}

//outputs mean data or results that will be sent from our view model to our view
abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}
