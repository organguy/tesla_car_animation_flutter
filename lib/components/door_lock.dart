import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tesla_animation/controllers/home_controller.dart';
import 'package:tesla_animation/utils/constraints.dart';

class DoorLock extends GetView<HomeController> {

  final RxBool isLock;
  final VoidCallback press;

  const DoorLock({
    Key? key,
    required this.isLock,
    required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Obx(() {
        return AnimatedSwitcher(
            duration: defaultDuration,
            switchInCurve: Curves.easeInOutBack,
            transitionBuilder: (child, animation) =>
                ScaleTransition(
                  scale: animation,
                  child: child,
                ),
            child: isLock.value
                ? SvgPicture.asset(
              'assets/icons/door_lock.svg',
              key: const ValueKey('lock'),
            )
                : SvgPicture.asset(
              'assets/icons/door_unlock.svg',
              key: const ValueKey('unlock'),
            )
        );
      }),
    );
  }
}
