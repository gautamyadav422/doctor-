import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class BusinessDetailsController extends GetxController {
  final signupScreenPageGolbalKey = new GlobalKey();

  final Rx<ValueKey> selectedKey = ValueKey('').obs;

  RxInt selectedIndex = (-1).obs;

  RxBool arrowState = false.obs;

  RxString? selectedValue;

  RxList<String> items = [
    'Individual',
    'Proprietorship',
    'Partnership',
    'Trust',
    'LLP',
    'Pvt Ltd',
    'Other',
  ].obs;

  void changeRadio(int index) {
    selectedIndex.value = index;
  }
}
