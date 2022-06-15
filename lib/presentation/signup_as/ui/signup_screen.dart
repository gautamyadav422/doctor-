import 'package:doctor/common/widgets/app_container.dart';
import 'package:doctor/common/widgets/horizontal_spacer.dart';
import 'package:doctor/common/widgets/primary_button.dart';
import 'package:doctor/common/widgets/progeress_indicator.dart';
import 'package:doctor/common/widgets/selectable_container.dart';
import 'package:doctor/common/widgets/text_view.dart';
import 'package:doctor/common/widgets/vertical_spacer.dart';
import 'package:doctor/constant/asset_path_constant.dart';
import 'package:doctor/constant/color_constant.dart';
import 'package:doctor/constant/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.appBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: InkWell(
                onTap: () => Get.back(),
                child: SvgPicture.asset(
                  AssetPathConstant.backIcon,
                  color: ColorConstant.iconsButtonColor,
                  height: 18,
                  width: 10.5,
                ),
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SelectableContainer(
                onPressed: () {},
                height: 52,
                isSelected: true,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AssetPathConstant.doctorIcon,
                        color: ColorConstant.iconsButtonColor,
                      ),
                      const HorizontalSpacer(
                        spacing: 12,
                      ),
                      const TextView(
                        text: StringConstant.doctorDentistLabel,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const VerticalSpacer(
              spacing: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SelectableContainer(
                onPressed: () {},
                height: 52,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AssetPathConstant.heathCareIcon,
                        color: ColorConstant.iconsButtonColor,
                      ),
                      const HorizontalSpacer(
                        spacing: 12,
                      ),
                      const TextView(
                        text: StringConstant.healthCareServiceLabel,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const VerticalSpacer(
              spacing: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SelectableContainer(
                onPressed: () {},
                height: 52,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AssetPathConstant.medicalIcon,
                        color: ColorConstant.iconsButtonColor,
                      ),
                      const HorizontalSpacer(
                        spacing: 12,
                      ),
                      const TextView(
                        text: StringConstant.medicalStoreLabel,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const VerticalSpacer(
              spacing: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SelectableContainer(
                onPressed: () {},
                height: 52,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AssetPathConstant.otherIcon,
                        color: ColorConstant.iconsButtonColor,
                      ),
                      const HorizontalSpacer(
                        spacing: 12,
                      ),
                      const TextView(
                        text: StringConstant.otherLabel,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const VerticalSpacer(
              spacing: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Visibility(
                child: PrimaryButton(
                  text: StringConstant.nextButton,
                  onPressed: () {},
                ),
              ),
            ),
            const VerticalSpacer(
              spacing: 10,
            ),
          ],
        ),
      ),
    );
  }
}
