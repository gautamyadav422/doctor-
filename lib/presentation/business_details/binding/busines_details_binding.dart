import 'package:get/get.dart';

import '../controller/busines_details_controller.dart';

class BusinessDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BusinessDetailsController());
  }
}
