import 'package:doctor/presentation/aadhaar_verify/binding/aadhaar_binding.dart';
import 'package:doctor/presentation/aadhaar_verify/ui/aadhaar_screen.dart';
import 'package:doctor/presentation/business_details/binding/busines_details_binding.dart';
import 'package:doctor/presentation/business_details/ui/business_details_screen.dart';
import 'package:doctor/presentation/email_verify/binding/email_binding.dart';
import 'package:doctor/presentation/email_verify/ui/email_screen.dart';
import 'package:doctor/presentation/hospital_details/binding/hospital_details_binding.dart';
import 'package:doctor/presentation/hospital_details/ui/hospital_details_screen.dart';
import 'package:doctor/presentation/login/binding/login_binding.dart';
import 'package:doctor/presentation/login/ui/login_screen.dart';
import 'package:doctor/presentation/signup_as/binding/signup_binding.dart';
import 'package:doctor/presentation/signup_as/ui/signup_screen.dart';
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
    GetPage<MaterialPageRoute>(
      name: Routes.signup.name,
      page: () => const SignupScreen(),
      binding: SignUpBinding(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.businesDetail.name,
      page: () => BusinessScreen(),
      binding: BusinessDetailBinding(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.emailVerify.name,
      page: () => const EmailScreen(),
      binding: EmailBinding(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.aadhaarVerify.name,
      page: () => const AadhaarScreen(),
      binding: AadhaarBinding(),
    ),
    GetPage<MaterialPageRoute>(
      name: Routes.hospitalDetails.name,
      page: () =>  HospitalDetailsScreen(),
      binding: HospitailDetailsBinding(),
    ),

  ];
}
