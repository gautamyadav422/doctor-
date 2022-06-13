import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:gmoney/common/controller/auth_controller.dart';
import 'package:gmoney/common/widgets/app_container.dart';
import 'package:gmoney/common/widgets/app_form_field.dart';
import 'package:gmoney/common/widgets/text_view.dart';
import 'package:gmoney/common/widgets/vertical_spacer.dart';
import 'package:gmoney/constant/asset_path_constant.dart';
import 'package:gmoney/common/widgets/primary_button.dart';
import 'package:gmoney/constant/color_constant.dart';
import 'package:gmoney/constant/string_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: Get.find<AuthController>(),
      builder: (controller) => Scaffold(
        backgroundColor: ColorConstant.appBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpacer(spacing: 36),
                SvgPicture.asset(
                  AssetPathConstant.logoSvg,
                ),
                VerticalSpacer(spacing: 60),
                TextView(
                  text: StringConstant.loginLabel,
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                VerticalSpacer(spacing: 28),
                TextView(
                  text: StringConstant.mobileNumberLabel,
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorConstant.secondaryTextColor,
                  ),
                ),
                VerticalSpacer(),
                _buildMobileNumberField(controller),
                VerticalSpacer(spacing: 16,),
                AppContainer(
                  child: Container(
                    width: 100,
                    height: 100,
                  ),
                ),
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
