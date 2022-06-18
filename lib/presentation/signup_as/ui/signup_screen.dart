import 'package:doctor/common/widgets/horizontal_spacer.dart';
import 'package:doctor/common/widgets/primary_button.dart';
import 'package:doctor/common/widgets/progeress_indicator.dart';
import 'package:doctor/common/widgets/selectable_container.dart';
import 'package:doctor/common/widgets/text_view.dart';
import 'package:doctor/common/widgets/vertical_spacer.dart';
import 'package:doctor/constant/asset_path_constant.dart';
import 'package:doctor/constant/color_constant.dart';
import 'package:doctor/constant/key_constant.dart';
import 'package:doctor/constant/string_constant.dart';
import 'package:doctor/presentation/signup_as/controller/signup_controller.dart';
import 'package:doctor/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: Get.find<SignUpController>(),
      builder: (controller) => Scaffold(
        key: controller.signupScreenPageGolbalKey,
        appBar: AppBar(
          backgroundColor: ColorConstant.appBackgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset(
              AssetPathConstant.backIcon,
              color: ColorConstant.iconsButtonColor,
              height: 18,
              width: 10.5,
            ),
            onPressed: () => Get.offAndToNamed(Routes.login.name),
          ),
        ),
        backgroundColor: ColorConstant.appBackgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpacer(),
                const PregressIndicator(totalStep: 100, currentStep: 20),
                const VerticalSpacer(spacing: 71),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextView(
                    text: StringConstant.signupAsLabel,
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
                    text: StringConstant.signupSelectLabel,
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorConstant.secondaryTextColor,
                    ),
                  ),
                ),
                const VerticalSpacer(
                  spacing: 8,
                ),
                _selectableTab(
                    index: 1,
                    isSelected:
                        controller.selectedKey.value == KeyConstant.doctorKey,
                    text: StringConstant.doctorDentistLabel,
                    icons: AssetPathConstant.doctorIcon),
                const VerticalSpacer(
                  spacing: 24,
                ),
                _selectableTab(
                    index: 2,
                    isSelected:
                        controller.selectedKey.value == KeyConstant.healthKey,
                    text: StringConstant.healthCareServiceLabel,
                    icons: AssetPathConstant.heathCareIcon),
                const VerticalSpacer(
                  spacing: 24,
                ),
                _selectableTab(
                    index: 3,
                    isSelected:
                        controller.selectedKey.value == KeyConstant.medicalKey,
                    text: StringConstant.medicalStoreLabel,
                    icons: AssetPathConstant.medicalIcon),
                const VerticalSpacer(
                  spacing: 24,
                ),
                _selectableTab(
                    index: 4,
                    isSelected:
                        controller.selectedKey.value == KeyConstant.otherKey,
                    text: StringConstant.otherLabel,
                    icons: AssetPathConstant.otherIcon),
                const VerticalSpacer(
                  spacing: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Visibility(
                    child: PrimaryButton(
                      text: StringConstant.nextButtonLabel,
                      onPressed: () {
                        // Get.to(BusinessScreen());
                        Get.offAndToNamed(Routes.businesDetail.name);
                      },
                    ),
                  ),
                ),
                const VerticalSpacer(
                  spacing: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectableTab(
      {String? text,
      String? icons,
      required bool isSelected,
      required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GetX<SignUpController>(
        builder: (controller) => SelectableContainer(
          isSelected: controller.selectedIndex.value == index,
          onPressed: () {
            final signupController = Get.find<SignUpController>();
            signupController.changeTab(index);
          },
          height: 52,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                SvgPicture.asset(
                  icons!,
                  color: ColorConstant.iconsButtonColor,
                ),
                const HorizontalSpacer(
                  spacing: 12,
                ),
                TextView(
                  text: text,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
