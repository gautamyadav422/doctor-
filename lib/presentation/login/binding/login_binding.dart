import 'package:doctor/common/controller/auth_controller.dart';
import 'package:doctor/provider/auth_provider.dart';
import 'package:doctor/repository/auth_repository.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AuthProvider());
    Get.lazyPut(() => AuthRepository(provider: Get.find()));
    Get.lazyPut(() => AuthController(repository: Get.find()));
  }

}