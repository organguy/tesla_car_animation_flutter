import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tesla_animation/components/battery_status.dart';
import 'package:tesla_animation/components/door_lock.dart';
import 'package:tesla_animation/components/temp_details.dart';
import 'package:tesla_animation/components/tesla_bottom_navigation_bar.dart';
import 'package:tesla_animation/components/tyre_psi_card.dart';
import 'package:tesla_animation/components/tyres.dart';
import 'package:tesla_animation/controllers/home_controller.dart';
import 'package:tesla_animation/models/TyrePsi.dart';
import 'package:tesla_animation/utils/constraints.dart';

class HomeScreen extends GetView<HomeController>{
  const HomeScreen({Key? key}) : super(key: key);


  SafeArea _getBody() {
    return SafeArea(
        child: LayoutBuilder(
            builder: (context, constraints) {
              return Obx(() {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 1500),
                      curve: controller.selectedBottomTab.value == 2
                          ? const Interval(0.0, 0.2)
                          : const Interval(0.0, 0.2),
                      left: controller.selectedBottomTab.value == 2
                          ? constraints.maxWidth / 2
                          : 0,
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: constraints.maxHeight * 0.1),
                        child: SvgPicture.asset(
                          'assets/icons/Car.svg',
                          width: double.infinity,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                        duration: defaultDuration,
                        right: controller.selectedBottomTab.value == 0
                            ? constraints.maxWidth * 0.05
                            : constraints.maxWidth / 2,
                        child: AnimatedOpacity(
                          duration: defaultDuration,
                          opacity: controller.selectedBottomTab.value == 0
                              ? 1
                              : 0,
                          child: DoorLock(
                            isLock: controller.isRightDoorLock,
                            press: controller.updateRightDoorLock,
                          ),
                        )
                    ),
                    AnimatedPositioned(
                        duration: defaultDuration,
                        left: controller.selectedBottomTab.value == 0
                            ? constraints.maxWidth * 0.05
                            : constraints.maxWidth / 2,
                        child: AnimatedOpacity(
                          duration: defaultDuration,
                          opacity: controller.selectedBottomTab.value == 0
                              ? 1
                              : 0,
                          child: DoorLock(
                            isLock: controller.isLeftDoorLock,
                            press: controller.updateLeftDoorLock,
                          ),
                        )
                    ),
                    AnimatedPositioned(
                        duration: defaultDuration,
                        top: controller.selectedBottomTab.value == 0
                            ? constraints.maxHeight * 0.13
                            : constraints.maxHeight / 2,
                        child: AnimatedOpacity(
                          duration: defaultDuration,
                          opacity: controller.selectedBottomTab.value == 0
                              ? 1
                              : 0,
                          child: DoorLock(
                            isLock: controller.isBonnetLock,
                            press: controller.updateBonnetLock,
                          ),
                        )
                    ),
                    AnimatedPositioned(
                        duration: defaultDuration,
                        bottom: controller.selectedBottomTab.value == 0
                            ? constraints.maxHeight * 0.17
                            : constraints.maxHeight / 2,
                        child: AnimatedOpacity(
                          duration: defaultDuration,
                          opacity: controller.selectedBottomTab.value == 0
                              ? 1
                              : 0,
                          child: DoorLock(
                            isLock: controller.isTrunkLock,
                            press: controller.updateTrunkLock,
                          ),
                        )
                    ),
                    AnimatedOpacity(
                      duration: defaultDuration,
                      curve: const Interval(0.0, 0.5),
                      opacity: controller.selectedBottomTab.value == 1 ? 1 : 0,
                      child: SvgPicture.asset(
                        'assets/icons/Battery.svg',
                        width: constraints.maxWidth * 0.45,
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      curve: const Interval(0.6, 1.0),
                      top: controller.selectedBottomTab.value == 1 ? 0 : 50,
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: AnimatedOpacity(
                          duration: defaultDuration,
                          curve: const Interval(0.6, 1.0),
                          opacity: controller.selectedBottomTab.value == 1
                              ? 1
                              : 0,
                          child: BatteryStatus(constraints: constraints)
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 700),
                      curve: const Interval(0.45, 0.65),
                      top: controller.selectedBottomTab.value == 2 ? 0 : 60,
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 700),
                          curve: controller.selectedBottomTab.value == 2
                              ? const Interval(0.45, 0.65)
                              : const Interval(0.0, 0.0),
                          opacity: controller.selectedBottomTab.value == 2
                              ? 1
                              : 0,
                          child: const TempDetails()
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 700),
                      curve: const Interval(0.7, 1.0),
                      right: controller.selectedBottomTab.value == 2 ? 0 : -180,
                      child: AnimatedSwitcher(
                        duration: defaultDuration,
                        child: controller.isCoolSelected.value
                            ? Image.asset(
                          'assets/images/Cool_glow_2.png',
                          width: 200,
                        )
                            : Image.asset(
                          'assets/images/Hot_glow_4.png',
                          width: 200,
                        )
                        ,
                      ),
                    ),
                    if(controller.isShowTyre.value)...tyres(constraints),
                    if(controller.isShowTyreStatus.value)
                      GridView.builder(
                          itemCount: 4,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: defaultPadding,
                            crossAxisSpacing: defaultPadding,
                            childAspectRatio: constraints.maxWidth /
                                constraints.maxHeight,
                          ),
                          itemBuilder: (context, index) {
                            return ScaleTransition(
                              scale: controller.tyreAnimations[index],
                              child: TyrePsiCard(
                                isBottomTwoTyre: index > 1,
                                tyrePsi: demoPsiList[index],
                              ),
                            );
                          }),
                  ],
                );
              });
            }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge([
          controller,
          controller.tyreAnimationController,
        ]),
        builder: (context, _) {
          return Scaffold(
            body: _getBody(),
            bottomNavigationBar: TeslaBottomNavigationBar(
              onTap: (index) {
                controller.onBottomNavigationTab(index);
              },
              selectedTab: controller.selectedBottomTab,
            ),
          );
        }
    );
  }
}