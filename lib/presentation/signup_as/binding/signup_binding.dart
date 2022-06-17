import 'package:doctor/presentation/signup_as/controller/signup_controller.dart';
import 'package:doctor/presentation/splash/controller/splash_screen_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
