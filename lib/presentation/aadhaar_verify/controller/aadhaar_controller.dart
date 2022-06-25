import 'package:doctor/repository/kyc_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AadhaarController extends GetxController
{
  AadhaarController({required this.repository});

  final KycRepository repository;


  final signupScreenPageGolbalKey = GlobalKey();

  final Rx<ValueKey> selectedKey =  ValueKey('').obs;

  RxInt selectedIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
  }

  void changeTab(int index) {
    selectedIndex.value = index;
  }


}