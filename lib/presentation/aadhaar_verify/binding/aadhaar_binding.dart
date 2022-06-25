import 'package:doctor/presentation/aadhaar_verify/controller/aadhaar_controller.dart';
import 'package:doctor/provider/kyc_provider.dart';
import 'package:doctor/repository/kyc_repository.dart';
import 'package:get/get.dart';

class AadhaarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KycProvider());
    Get.lazyPut(() => KycRepository(provider: Get.find()));
    Get.lazyPut(() => AadhaarController(repository: Get.find()));
  }
}
