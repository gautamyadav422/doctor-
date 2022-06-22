import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class HospitalDetailsController extends GetxController {
  final hospitalPageGlobalKey = GlobalKey();

  RxBool individualState = false.obs;
  RxBool partnerState = false.obs;

  @override
  void onInit() {
    super.onInit();
  }
}
