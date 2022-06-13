import 'package:doctor/presentation/splash/controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<SplashScreenController>(),
      builder: (controller) => Scaffold(
        body: Container(
        ),
      ),
    );
  }
}
