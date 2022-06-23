import 'package:doctor/presentation/hospital_details/controller/hospital_details_controller.dart';
import 'package:get/get.dart';


class HospitailDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HospitalDetailsController());
  }
}
