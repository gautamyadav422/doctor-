import 'package:get/get.dart';
import 'package:gmoney/common/controller/auth_controller.dart';
import 'package:gmoney/provider/auth_provider.dart';
import 'package:gmoney/repository/auth_repository.dart';

class MobileNumberScreenBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AuthProvider());
    Get.lazyPut(() => AuthRepository(provider: Get.find()));
    Get.lazyPut(() => AuthController(repository: Get.find()));
  }
}