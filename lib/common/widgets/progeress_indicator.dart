import 'package:doctor/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class PregressIndicator extends StatelessWidget {
  const PregressIndicator(
      {Key? key, required this.totalStep, required this.currentStep})
      : super(key: key);
  final int totalStep;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return StepProgressIndicator(
      totalSteps: totalStep,
      currentStep: currentStep,
      size: 5,
      padding: 0,
      selectedGradientColor: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorConstant.progressLine1Color,
            ColorConstant.progressLine2Color
          ]),
      unselectedGradientColor: LinearGradient(colors: [
        ColorConstant.progressWhiteLineColor,
        ColorConstant.progressWhiteLineColor
      ], end: Alignment.bottomRight, begin: Alignment.topLeft),
    );
  }
}
