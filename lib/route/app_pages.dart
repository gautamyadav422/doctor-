import 'package:doctor/presentation/login/binding/login_binding.dart';
import 'package:doctor/presentation/login/ui/login_screen.dart';
import 'package:doctor/presentation/splash/binding/splash_screen_binding.dart';
import 'package:doctor/presentation/splash/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage<MaterialPageRoute>(
      name: Routes.launch.name,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.login.name,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
  ];
}
