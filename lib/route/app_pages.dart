import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gmoney/presentation/mobile_number/binding/login_screen_binding.dart';
import 'package:gmoney/presentation/mobile_number/ui/login_screen.dart';
import 'package:gmoney/presentation/splash/binding/splash_screen_binding.dart';
import 'package:gmoney/presentation/splash/ui/splash_screen.dart';
import 'package:gmoney/route/routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage<MaterialPageRoute>(
      name: Routes.launch.name,
      page: () => SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.mobileNumber.name,
      page: () => LoginScreen(),
      binding: MobileNumberScreenBinding(),
    ),
  ];
}
