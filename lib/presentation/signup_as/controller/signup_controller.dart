import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final signupScreenPageGolbalKey = new GlobalKey();

  final Rx<ValueKey> selectedKey = ValueKey('').obs;

  RxInt selectedIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
  }

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
