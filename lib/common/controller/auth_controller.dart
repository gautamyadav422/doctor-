import 'dart:async';

import 'package:doctor/model/otp_verify_request.dart';
import 'package:doctor/model/send_otp_request.dart';
import 'package:doctor/repository/auth_repository.dart';
import 'package:doctor/util/log.dart';
import 'package:doctor/util/snack_bar_util.dart';
import 'package:doctor/util/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:doctor/model/country_response.dart';

class AuthController extends GetxController {
  AuthController({required this.repository});

  final AuthRepository repository;
  final mobileNumberTextEditingController = TextEditingController();
  final otpTextEditingController = TextEditingController();
  RxBool isOTPFieldVisible = false.obs;
  RxBool generateOTPButtonVisibility = true.obs;
  RxBool submitButtonVisibility = false.obs;
  List data = []; //edited line
  RxList<Country> countryList = <Country>[].obs;
  RxInt counter = 0.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    getCountryCode();
  }

  @override
  void onClose() {
    timer?.cancel();
  }

 /// Resend OTP
  Future<void> startTimer() async {
    counter.value = 60;
    if (timer != null && timer!.isActive) {
      return;
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      Log.d(counter.value.toString());
     /* (counter.value > 0) ? counter.value-- : timer.cancel();*/
      if (counter.value > 0) {
        counter.value = counter.value - 1;
      } else {
        timer.cancel();
      }


    });
  }



  ///Generate OTP
  Future<void> sendOTP() async {
    if (StringUtil.validateMobile(mobileNumberTextEditingController.text) ==
        false) {
      Utils.showToast("please enter valid 10 digit mobile number");
    } else {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);

      final model =
          SendOTPRequest(mobile: mobileNumberTextEditingController.text);
         repository.sendOTP(model).then((value) {
        EasyLoading.dismiss();
        isOTPFieldVisible.value = true;
        generateOTPButtonVisibility.value = false;
        submitButtonVisibility.value = true;
        startTimer();
        Log.d('success');
      }).catchError((error) {
        EasyLoading.dismiss();
        Log.e('Error: error');
      });
    }
  }

  ///get Country Code

  Future<void> getCountryCode() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    repository.getCountry().then((value) {
      EasyLoading.dismiss();
      countryList.addAll(value);
      data.add(value);
      Log.e(data.length.toString());
      Log.e('success');
    }).catchError((error) {
      EasyLoading.dismiss();
      print(error);
      Log.e('Error111: error');
    });
  }

  ///Verify OTP
  Future<void> verifyOTP() async {
    if (StringUtil.validateOTP(otpTextEditingController.text) == false) {
      Utils.showToast("please enter valid OTP");
    } else {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);

      final model = VerifyOTPRequest(
          mobile: mobileNumberTextEditingController.text,
          user_profile: "2",
          otp: otpTextEditingController.text);
      repository.verifyOTP(model).then((value) {
        EasyLoading.dismiss();
        Log.d('success');
      }).catchError((error) {
        EasyLoading.dismiss();
        Log.e('Error: error');
      });
    }
  }
}
