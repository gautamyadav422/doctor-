import 'package:doctor/constant/string_constant.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class BusinessDetailsController extends GetxController {
  final signupScreenPageGolbalKey = new GlobalKey();

  final Rx<ValueKey> selectedKey = ValueKey('').obs;

  RxInt selectedIndex = (-1).obs;

  RxBool arrowState = false.obs;

  RxString selectEntityValue= StringConstant.selectentityLabel.obs;

  RxString selectAddressValue= StringConstant.addressTypeLabel.obs;

  RxList<String> items = [
    StringConstant.selectentityLabel,
    'Individual',
    'Proprietorship',
    'Partnership',
    'Trust',
    'LLP',
    'Pvt Ltd',
    'Other',
  ].obs;


  RxList<String> addressItems = [
    StringConstant.addressTypeLabel,
    'Business',
    'Communication',
    'Current',
    'Permanent',
    'Residential'
  ].obs;

  void changeRadio(int index) {
    selectedIndex.value = index;
  }
}
