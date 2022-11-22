import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tesla_animation/controllers/home_controller.dart';
import 'package:tesla_animation/utils/constraints.dart';

class TeslaBottomNavigationBar extends GetView<HomeController> {

  final RxInt selectedTab;
  final ValueChanged<int> onTap;

  const TeslaBottomNavigationBar({
    Key? key,
    required this.selectedTab,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        onTap: onTap,
        currentIndex: selectedTab.value,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: List.generate(navIconSrc.length, (index) {
          return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                navIconSrc[index],
                color: index == selectedTab.value ? primaryColor : Colors.white54,
              ),
              label: ""
          );
        }),
      );
    });
  }
}

List<String> navIconSrc = [
  'assets/icons/Lock.svg',
  'assets/icons/Charge.svg',
  'assets/icons/Temp.svg',
  'assets/icons/Tyre.svg',
];