import 'package:doctor/common/controller/auth_controller.dart';
import 'package:doctor/common/widgets/app_form_field.dart';
import 'package:doctor/common/widgets/otp_fields.dart';
import 'package:doctor/common/widgets/primary_button.dart';
import 'package:doctor/common/widgets/selectable_container.dart';
import 'package:doctor/common/widgets/text_view.dart';
import 'package:doctor/common/widgets/vertical_spacer.dart';
import 'package:doctor/constant/asset_path_constant.dart';
import 'package:doctor/constant/color_constant.dart';
import 'package:doctor/constant/string_constant.dart';
import 'package:doctor/util/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: Get.find<AuthController>(),
      builder: (controller) => Scaffold(
        backgroundColor: ColorConstant.appBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpacer(spacing: 36),
                SvgPicture.asset(
                  AssetPathConstant.logoSvg,
                ),
                const VerticalSpacer(spacing: 60),
                const TextView(
                  text: StringConstant.loginLabel,
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const VerticalSpacer(spacing: 28),
                const TextView(
                  text: StringConstant.mobileNumberLabel,
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorConstant.secondaryTextColor,
                  ),
                ),
                const VerticalSpacer(),
                _buildMobileNumberField(controller),
                const VerticalSpacer(spacing: 24),
                _buildOTPField(context),
                _buildButtons(controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileNumberField(AuthController controller) {
    return AppFormField(
      hintText: StringConstant.mobileNumberHint,
      textEditingController: controller.mobileNumberTextEditingController,
    );
  }

  Widget _buildOTPField(BuildContext context) {
    return GetX<AuthController>(
      builder: (authController) {
        return Visibility(
          visible: authController.isOTPFieldVisible.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextView(
                text: StringConstant.otp,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorConstant.secondaryTextColor,
                ),
              ),
              const VerticalSpacer(),
              OTPFields(
                appContext: context,
                length: 4,
                obscureText: true,
                controller: authController.otpTextEditingController,
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildButtons(AuthController controller) {
    return

        ///generate OTP Button
        Expanded(
      child: Container(
        alignment: Alignment.bottomLeft,
        margin: const EdgeInsets.only(bottom: 12),
        child: GetX<AuthController>(
          builder: (authController) => Stack(
            children: [
              Visibility(
                visible: authController.generateOTPButtonVisibility.value,
                child: PrimaryButton(
                  text: StringConstant.generateOTPLabel,
                  onPressed: () {
                    controller.sendOTP();
                  },
                ),
              ),
              Visibility(
                visible: authController.submitButtonVisibility.value,
                child: PrimaryButton(
                  text: StringConstant.submitLabel,
                  onPressed: () {

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
