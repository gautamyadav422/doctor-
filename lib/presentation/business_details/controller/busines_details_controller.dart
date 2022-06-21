import 'package:doctor/constant/string_constant.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class BusinessDetailsController extends GetxController {
  final signupScreenPageGolbalKey = new GlobalKey();


  RxBool arrowState = false.obs;

  RxString selectedValue= StringConstant.selectentityLabel.obs;

  RxList<String> items = [
    StringConstant.individualLabel,
    StringConstant.proprietorshiplLabel,
    StringConstant.partnershipLabel,
    StringConstant.trustLabel,
    StringConstant.llpLabel,
    StringConstant.pvtltdLabel,
    StringConstant.otherEntityLabel
  ].obs;


  RxList<String> addressItems = [
    'Business',
    'Communication',
    'Current',
    'Permanent',
    'Residential'
  ].obs;

}
