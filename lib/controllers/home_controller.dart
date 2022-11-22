import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{

  RxBool isRightDoorLock = true.obs;
  RxBool isLeftDoorLock = true.obs;
  RxBool isBonnetLock = true.obs;
  RxBool isTrunkLock = true.obs;
  RxInt selectedBottomTab = 0.obs;
  RxBool isCoolSelected = true.obs;
  RxBool isHeatSelected = false.obs;
  RxBool isShowTyre = false.obs;
  RxBool isShowTyreStatus = false.obs;

  late AnimationController _tyreAnimationController;
  late Animation<double> _animationTyre1Psi;
  late Animation<double> _animationTyre2Psi;
  late Animation<double> _animationTyre3Psi;
  late Animation<double> _animationTyre4Psi;
  late List<Animation<double>> _tyreAnimations;

  void setupTyreAnimation(){
    _tyreAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1200)
    );

    _animationTyre1Psi = CurvedAnimation(
        parent: _tyreAnimationController,
        curve: const Interval(0.34, 0.5),
    );

    _animationTyre2Psi = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: const Interval(0.5, 0.66),
    );

    _animationTyre3Psi = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: const Interval(0.66, 0.82),
    );

    _animationTyre4Psi = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: const Interval(0.82, 1.0),
    );
  }

  @override
  void onInit() {
    setupTyreAnimation();
    _tyreAnimations=[
      _animationTyre1Psi,
      _animationTyre2Psi,
      _animationTyre3Psi,
      _animationTyre4Psi,
    ];
    super.onInit();
  }

  @override
  void onClose() {
    _tyreAnimationController.dispose();
  }

  void updateRightDoorLock(){
    isRightDoorLock(!isRightDoorLock.value);
  }

  void updateLeftDoorLock(){
    isLeftDoorLock(!isLeftDoorLock.value);
  }

  void updateBonnetLock(){
    isBonnetLock(!isBonnetLock.value);
  }

  void updateTrunkLock(){
    isTrunkLock(!isTrunkLock.value);
  }

  void onBottomNavigationTab(int index){
    selectedBottomTab(index);
    showTyreController(index);
  }

  void updateSelectedTab(){
    isCoolSelected(!isCoolSelected.value);
    isHeatSelected(!isHeatSelected.value);
  }

  void showTyreController(int index){
    //if(selectedBottomTab.value != 3 && index == 3){
    if(index == 3){
      isShowTyreStatus(true);
      Future.delayed(
        const Duration(milliseconds: 400),
          (){
            isShowTyre(true);
          }
      );
      _tyreAnimationController.forward();
    }else{
      Future.delayed(
        const Duration(milliseconds: 300),
          (){
            isShowTyreStatus(false);
          }
      );
      _tyreAnimationController.reverse();
      isShowTyre(false);
    }
  }

  AnimationController get tyreAnimationController => _tyreAnimationController;

  List<Animation<double>> get tyreAnimations => _tyreAnimations;
}