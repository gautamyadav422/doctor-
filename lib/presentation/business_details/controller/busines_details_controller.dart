import 'dart:math';

import 'package:doctor/constant/string_constant.dart';
import 'package:doctor/model/entity_response.dart';
import 'package:doctor/model/pan_number_request.dart';
import 'package:doctor/repository/business_detail_repository.dart';
import 'package:doctor/util/snack_bar_util.dart';
import 'package:doctor/util/string_util.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class BusinessDetailsController extends GetxController {
  BusinessDetailsController({required this.repository});

  final BusinessDetailsRepository repository;

/*
  final signupScreenPageGolbalKey = new GlobalKey<ScaffoldState>();
*/

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Rx<ValueKey> selectedKey = ValueKey('').obs;

  RxInt selectedIndex = (-1).obs;

  RxBool arrowState = false.obs;

  RxString selectAddressValue = StringConstant.addressTypeLabel.obs;

  final entity = Entity(enityName: StringConstant.selectentityLabel, id: "0");
  RxList<Entity> entityList = <Entity>[].obs;

  Rx<Entity> selectedEntityValue = Entity().obs;

  final nameTextEditingController = TextEditingController();
  final addressTextEditingController = TextEditingController();
  final pinCodeTextEditingController = TextEditingController();
  final panNoTextEditingController = TextEditingController();
  final gstNoTextEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    entityList.add(entity);
    selectedEntityValue.value = entity;
    getEntityList();
  }

  ///get Country Code

  Future<void> getEntityList() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    repository.getEntity().then((value) {
      entityList.addAll(value.reversed);
      EasyLoading.dismiss();
    }).catchError((error) {
      EasyLoading.dismiss();
    });
  }

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

  ///Generate OTP
  Future<void> panVerify() async {
    if (StringUtil.validatePin(pinCodeTextEditingController.text) == false) {
      Utils.showToast(StringConstant.pinErrorMsgLabel);
    } else if (StringUtil.validatePan(panNoTextEditingController.text) ==
        false) {
      Utils.showToast(StringConstant.panErrorMsgLabel);
    } else if (selectedEntityValue.value.enityName != "PROPRIETOR" &&
        selectedEntityValue.value.enityName != "INDIVIDUAL") {
      if (StringUtil.validateGst(gstNoTextEditingController.text) == false) {
        Utils.showToast(StringConstant.gstErrorMsgLabel);
      }
    } else {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
      final model = PANVerifyRequest(pan: panNoTextEditingController.text);
      repository.panVerify(model).then((value) async {
        EasyLoading.dismiss();
      }).catchError((error) {
        EasyLoading.dismiss();
      });
    }
  }
}
