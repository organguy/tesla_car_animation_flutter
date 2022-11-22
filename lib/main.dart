import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tesla_animation/controllers/home_controller.dart';
import 'package:tesla_animation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tesla Animated',
      initialBinding: BindingsBuilder(() {
        Get.put(HomeController());
      }),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const HomeScreen(),
    );
  }
}