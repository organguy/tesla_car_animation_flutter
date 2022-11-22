import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tesla_animation/controllers/home_controller.dart';
import 'package:tesla_animation/utils/constraints.dart';

class TempBtn extends GetView<HomeController> {

  final String svgSrc, title;
  final VoidCallback press;
  final RxBool isActive;
  final Color activeColor;

  const TempBtn({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.press,
    required this.isActive,
    required this.activeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Obx(() {
        return Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOutBack,
              height: isActive.value ? 76 : 50,
              width: isActive.value ? 76 : 50,
              child: SvgPicture.asset(
                svgSrc,
                color: isActive.value ? activeColor : Colors.white38,
              ),
            ),
            const SizedBox(height: defaultPadding / 2,),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: 16,
                color: isActive.value ? activeColor : Colors.white38,
                fontWeight: isActive.value ? FontWeight.bold : FontWeight.normal,
              ),
              child: Text(
                title.toUpperCase(),
              ),
            )
          ],
        );
      }),
    );
  }
}