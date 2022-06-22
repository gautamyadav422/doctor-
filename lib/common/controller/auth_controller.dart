import 'dart:async';

import 'package:doctor/constant/key_constant.dart';
import 'package:doctor/constant/string_constant.dart';
import 'package:doctor/model/otp_verify_request.dart';
import 'package:doctor/model/pre_existing_request.dart';
import 'package:doctor/model/pre_existing_response.dart';
import 'package:doctor/model/send_otp_request.dart';
import 'package:doctor/repository/auth_repository.dart';
import 'package:doctor/route/routes.dart';
import 'package:doctor/util/log.dart';
import 'package:doctor/util/preference_util.dart';
import 'package:doctor/util/snack_bar_util.dart';
import 'package:doctor/util/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:doctor/model/country_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  AuthController({required this.repository});

  final AuthRepository repository;
  final mobileNumberTextEditingController = TextEditingController();
  final otpTextEditingController = TextEditingController();
  RxBool isOTPFieldVisible = false.obs;
  RxBool generateOTPButtonVisibility = true.obs;
  RxBool submitButtonVisibility = false.obs;
  RxList<Country> countryList = <Country>[].obs;
  RxList<ExistingUser> existingList = <ExistingUser>[].obs;
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
      Utils.showToast(StringConstant.stringMobileLabel);
    } else {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);

      final model =
          SendOTPRequest(mobile: mobileNumberTextEditingController.text);
      repository.sendOTP(model).then((value) async {
        EasyLoading.dismiss();
        isOTPFieldVisible.value = true;
        generateOTPButtonVisibility.value = false;
        submitButtonVisibility.value = true;

        final preference = PreferenceUtil.getInstance();
        preference.putValue(
            PreferenceKey.otpCode.name, value!.otpcode.toString());

        startTimer();
      }).catchError((error) {
        EasyLoading.dismiss();
      });
    }
  }

  ///get Country Code

  Future<void> getCountryCode() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    repository.getCountry().then((value) {
      EasyLoading.dismiss();
      countryList.addAll(value);
    }).catchError((error) {
      EasyLoading.dismiss();
      print(error);
    });
  }

  ///Verify OTP
  Future<void> verifyOTP() async {
    if (StringUtil.validateOTP(otpTextEditingController.text) == false) {
      Utils.showToast(StringConstant.stringOtpLabel);
    } else {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);

      final preference = PreferenceUtil.getInstance();
      final otp_code =
          preference.getValue<String>(PreferenceKey.otpCode.name) ?? false;

      final model = VerifyOTPRequest(
        mobile: mobileNumberTextEditingController.text,
        otp: otpTextEditingController.text,
        code: otp_code.toString(),
      );
      repository.verifyOTP(model).then((value) {
        verifyConsumer();
        EasyLoading.dismiss();
      }).catchError((error) {
        EasyLoading.dismiss();
      });
    }
  }

  /// Verify Consumer
  /// source 1 for doctor app
  Future<void> verifyConsumer() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);

    final model = PreExistingCustomerRequest(
      phone: mobileNumberTextEditingController.text,
      source:KeyConstant.sourcecode,
    );
    repository.verifyConsumer(model).then((value) {
      existingList.addAll(value);
      if (existingList.isEmpty) {
        /// New User Open Hospital Detail screen
        Get.toNamed(Routes.businesDetail.name);
      } else {
        /// Old User
        Get.toNamed(Routes.businesDetail.name);
      }

      print(value);
      EasyLoading.dismiss();
    }).catchError((error) {
      EasyLoading.dismiss();
    });
  }
}
