import 'package:doctor/repository/kyc_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailController extends GetxController
{
  EmailController({required this.repository});

  final KycRepository repository;

  final emailTextEditingController = TextEditingController();

}