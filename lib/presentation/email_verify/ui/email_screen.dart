import 'package:doctor/common/widgets/app_container.dart';
import 'package:doctor/common/widgets/app_form_field.dart';
import 'package:doctor/common/widgets/primary_button.dart';
import 'package:doctor/common/widgets/progeress_indicator.dart';
import 'package:doctor/common/widgets/text_view.dart';
import 'package:doctor/common/widgets/vertical_spacer.dart';
import 'package:doctor/constant/asset_path_constant.dart';
import 'package:doctor/constant/color_constant.dart';
import 'package:doctor/constant/string_constant.dart';
import 'package:doctor/presentation/email_verify/controller/email_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmailController>(
      init: Get.find<EmailController>(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.appBackgroundColor,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppContainer(
              child: IconButton(
                icon: SvgPicture.asset(
                  AssetPathConstant.backIcon,
                  color: ColorConstant.iconsButtonColor,
                  height: 18,
                  width: 10.5,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ),

        //backgroundColor: ColorConstant.appBackgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const VerticalSpacer(),
                const PregressIndicator(totalStep: 100, currentStep: 20),
                const VerticalSpacer(spacing: 71),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextView(
                    text: StringConstant.emailLable,
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const VerticalSpacer(
                  spacing: 28,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextView(
                    text: StringConstant.emailVerifyLable,
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorConstant.secondaryTextColor,
                    ),
                  ),
                ),
                const VerticalSpacer(
                  spacing: 28,
                ),
                _buildEmailVerifyField(controller),

                const VerticalSpacer(
                  spacing: 80,
                ),
                _buildButtons(controller),

              ],
            ),

          ),
        ),

      ),
    );
  }


  Widget _buildEmailVerifyField(EmailController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AppFormField(
          hintText: StringConstant.emailLable,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(AssetPathConstant.doctorIcon),
          ),
          textEditingController: controller.emailTextEditingController,
          autofocus: false,
          focusNode: FocusNode(),

      ),
    );
  }


  Widget _buildButtons(EmailController controller) {
    ///Verify Email Button
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            PrimaryButton(
                text: StringConstant.verifyEmailLabel,
                onPressed: () {
                 final emailcontroller= Get.find<EmailController>();
                // emailcontroller.emailTextEditingController
                },
              ),
          ],
        ),
      ),
    );
  }

}
