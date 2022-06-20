import 'package:doctor/common/controller/auth_controller.dart';
import 'package:doctor/common/widgets/app_form_field.dart';
import 'package:doctor/common/widgets/horizontal_spacer.dart';
import 'package:doctor/common/widgets/otp_fields.dart';
import 'package:doctor/common/widgets/primary_button.dart';
import 'package:doctor/common/widgets/text_view.dart';
import 'package:doctor/common/widgets/vertical_spacer.dart';
import 'package:doctor/constant/asset_path_constant.dart';
import 'package:doctor/constant/color_constant.dart';
import 'package:doctor/constant/string_constant.dart';
import 'package:doctor/model/country_response.dart';
import 'package:doctor/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? isChecked = false;
    return GetBuilder<AuthController>(
      init: Get.find<AuthController>(),
      builder: (controller) => Scaffold(
        backgroundColor: ColorConstant.appBackgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
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
                  const VerticalSpacer(
                    spacing: 80,
                  ),
                  _buildButtons(controller),
                ],
              ),
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
        keyboardType: TextInputType.number,
        maxLength: 10,
        autofocus: false,
        focusNode: FocusNode(),
        onChanged: (text) {
          if (controller.mobileNumberTextEditingController.text.length == 10) {
            controller.sendOTP();
          }
        },
        prefixIcon: _contryDropDownFiled(controller));
  }

  Widget _contryDropDownFiled(AuthController controller) {
    return GetX<AuthController>(
      builder: (controller) => DropdownButton<Country>(
        onChanged: (Country? selectedCountry) {},
        dropdownColor: ColorConstant.appBackgroundColor,
        underline: SizedBox.shrink(),
        items: controller.countryList
            .map(
              (country) => DropdownMenuItem<Country>(
                child: Row(
                  children: [
                    SvgPicture.network(country.flagUrl.toString()),
                    const HorizontalSpacer(),
                    TextView(
                      text: "+${country.code}",
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _resendOTPFiled(AuthController controller) {
    return GetX<AuthController>(
        builder: (controller) => controller.counter.value != 0
            ? TextView(
                text: "Resend OTP( ${controller.counter.toString()} sec )",
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorConstant.primaryButtonStartColor,
                ),
              )

            : InkWell(
                onTap: () {
                 // controller.enableResend=false.obs;
                  controller.sendOTP();
                 // _resendOTPFiled(controller);
                },
                child: const TextView(
                  text: StringConstant.resendotp ,
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorConstant.primaryButtonStartColor,
                  ),
                ),
              ));
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
                autoUnfocus: true,
                controller: authController.otpTextEditingController,
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (newValue) {},
                    activeColor: ColorConstant.primaryButtonEndColor,
                  ),
                  const Text.rich(
                    TextSpan(
                      text: StringConstant.iAgreeLabel ,
                      style: TextStyle(fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: StringConstant.tcLabel ,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                          // Single tapped.
                        ),
                        // can add more TextSpans here...
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildButtons(AuthController controller) {
    ///generate OTP Button
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GetX<AuthController>(
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
                  child: Column(
                    children: [
                      _resendOTPFiled(controller),
                      const VerticalSpacer(),
                      PrimaryButton(
                        text: StringConstant.submitLabel,
                        onPressed: () {
                          //Get.toNamed(Routes.signup.name);
                          controller.verifyOTP();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
