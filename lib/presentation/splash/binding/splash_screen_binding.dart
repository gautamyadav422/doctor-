import 'package:get/get.dart';
import 'package:gmoney/presentation/splash/controller/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {


  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
  }

}