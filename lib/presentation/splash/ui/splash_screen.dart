import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney/presentation/splash/controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<SplashScreenController>(),
      builder: (controller) => Scaffold(
        body: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
