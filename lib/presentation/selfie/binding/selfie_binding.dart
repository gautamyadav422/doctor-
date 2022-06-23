import 'package:doctor/presentation/selfie/controller/selfie_controller.dart';
import 'package:get/get.dart';

class SelfieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelfieController());
  }
}