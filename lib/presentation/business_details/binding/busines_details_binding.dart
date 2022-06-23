import 'package:doctor/provider/auth_provider.dart';
import 'package:doctor/provider/business_provider.dart';
import 'package:doctor/repository/auth_repository.dart';
import 'package:doctor/repository/business_detail_repository.dart';
import 'package:get/get.dart';

import '../controller/busines_details_controller.dart';

class BusinessDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BusinessDetailsProvider());
    Get.lazyPut(() => BusinessDetailsRepository(provider: Get.find()));
    Get.lazyPut(() => BusinessDetailsController(repository: Get.find()));
  }
}
