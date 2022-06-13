import 'package:doctor/route/routes.dart';
import 'package:doctor/util/preference_util.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    redirect();
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(milliseconds: 200));
    final preference = PreferenceUtil.getInstance();
    final isLoggedIn = preference.getValue<bool>(PreferenceKey.isLoggedIn.name) ?? false;
    if (isLoggedIn) {
      /// Redirect to home Screen
    } else {
      /// Redirect to Mobile Number Screen
      Get.offAndToNamed(Routes.login.name);
    }
  }
}