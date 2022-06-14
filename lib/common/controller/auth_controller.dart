import 'package:doctor/model/send_otp_request.dart';
import 'package:doctor/repository/auth_repository.dart';
import 'package:doctor/util/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {

  AuthController({required this.repository});

  final AuthRepository repository;
  final mobileNumberTextEditingController = TextEditingController();
  RxBool isOTPFieldVisible = false.obs;
  RxBool generateOTPButtonVisibility = true.obs;
  RxBool submitButtonVisibility = false.obs;


  Future<void> sendOTP() async{
    EasyLoading.show(
        maskType: EasyLoadingMaskType.black
    );
    final model = SendOTPRequest(mobile: mobileNumberTextEditingController.text);
    repository.sendOTP(model).then((value) {
      EasyLoading.dismiss();
      isOTPFieldVisible.value = true;
      generateOTPButtonVisibility.value = false;
      submitButtonVisibility.value = true;
      Log.d('success');
    }).catchError((error){
      EasyLoading.dismiss();
      Log.e('Error: error');
    });
  }

}