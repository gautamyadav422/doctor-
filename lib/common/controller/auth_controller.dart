import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:gmoney/models/send_otp.dart';
import 'package:gmoney/repository/auth_repository.dart';

class AuthController extends GetxController {

  AuthController({required this.repository});

  final AuthRepository repository;
  final mobileNumberTextEditingController = TextEditingController();


  Future<void> sendOTP() async{
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black
    );
    final model = SendOTP(mobile: '');
    repository.sendOTP(model).then((value) {
      EasyLoading.dismiss();
      print('success');
    }).catchError((error){
      EasyLoading.dismiss();
      print('Error: error');
    });
  }
}