import 'package:doctor/presentation/email_verify/controller/email_controller.dart';
import 'package:doctor/provider/kyc_provider.dart';
import 'package:doctor/repository/kyc_repository.dart';
import 'package:get/get.dart';

class EmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KycProvider());
    Get.lazyPut(() => KycRepository(provider: Get.find()));
    Get.lazyPut(() => EmailController(repository: Get.find()));
  }
}
