import 'package:doctor/common/controller/auth_controller.dart';
import 'package:doctor/common/widgets/app_form_field.dart';
import 'package:doctor/common/widgets/primary_button.dart';
import 'package:doctor/common/widgets/text_view.dart';
import 'package:doctor/common/widgets/vertical_spacer.dart';
import 'package:doctor/constant/asset_path_constant.dart';
import 'package:doctor/constant/color_constant.dart';
import 'package:doctor/constant/string_constant.dart';
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
                _buildGenerateOTPButton(controller),
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

  Widget _buildGenerateOTPButton(AuthController controller) {
    return

      ///generate OTP Button
      Expanded(
        child: Container(
          alignment: Alignment.bottomLeft,
          margin: const EdgeInsets.only(bottom: 12),
          child: PrimaryButton(
            text: StringConstant.generateOTPLabel,
            onPressed: () {
              controller.sendOTP();
            },
          ),
        ),
      );
  }
}
