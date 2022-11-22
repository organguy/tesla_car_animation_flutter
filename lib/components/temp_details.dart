import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tesla_animation/components/temp_btn.dart';
import 'package:tesla_animation/controllers/home_controller.dart';
import 'package:tesla_animation/utils/constraints.dart';

class TempDetails extends GetView<HomeController> {
  const TempDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                TempBtn(
                  svgSrc: 'assets/icons/coolShape.svg',
                  title: 'Cool',
                  press: controller.updateSelectedTab,
                  activeColor: primaryColor,
                  isActive: controller.isCoolSelected,
                ),
                const SizedBox(width: defaultPadding,),
                TempBtn(
                  svgSrc: 'assets/icons/heatShape.svg',
                  title: 'Heat',
                  press: controller.updateSelectedTab,
                  activeColor: redColor,
                  isActive: controller.isHeatSelected,
                )
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: (){},
                icon: const Icon(Icons.arrow_drop_up, size: 48,),
              ),
              const Text(
                "29\u2103",
                style: TextStyle(
                    fontSize: 86
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: (){},
                icon: const Icon(Icons.arrow_drop_down, size: 48,),
              ),
            ],
          ),
          const Spacer(),
          const Text('CURRENT TEMPERATURE'),
          const SizedBox(height: defaultPadding,),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Inside'.toUpperCase()
                  ),
                  Text(
                    '20\u2103',
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
              const SizedBox(width: defaultPadding,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Outside'.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white54
                    ),
                  ),
                  Text(
                    '35\u2103',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white54,
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}