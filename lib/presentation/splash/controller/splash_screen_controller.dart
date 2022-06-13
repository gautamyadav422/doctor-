import 'package:get/get.dart';
import 'package:gmoney/route/routes.dart';
import 'package:gmoney/util/log.dart';
import 'package:gmoney/util/pref_util.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    Log.d('inside onInit');
    redirect();
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final preference = await PreferenceUtil.getInstance();
    final isLoggedIn = preference.getValue<bool>(PreferenceKey.isLoggedIn.name) ?? false;
    if (isLoggedIn) {
      /// Redirect to home Screen
    } else {
      /// Redirect to Mobile Number Screen
      Get.offAndToNamed(Routes.mobileNumber.name);
    }
  }
}