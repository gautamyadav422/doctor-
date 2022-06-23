import 'package:doctor/common/widgets/app_container.dart';
import 'package:doctor/common/widgets/custom_appbar.dart';
import 'package:doctor/common/widgets/primary_button.dart';
import 'package:doctor/common/widgets/progeress_indicator.dart';
import 'package:doctor/common/widgets/text_view.dart';
import 'package:doctor/common/widgets/vertical_spacer.dart';
import 'package:doctor/constant/asset_path_constant.dart';
import 'package:doctor/constant/color_constant.dart';
import 'package:doctor/constant/string_constant.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelfieScreenPage extends StatelessWidget {
  const SelfieScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        imagePath: AssetPathConstant.backIcon,
        onPressed: () {},
      ),
      backgroundColor: ColorConstant.appBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpacer(
            spacing: 10,
          ),
          const PregressIndicator(
            totalStep: 100,
            currentStep: 20,
          ),
          VerticalSpacer(
            spacing: 28,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: TextView(
              text: StringConstant.selfieLabel,
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          VerticalSpacer(
            spacing: 28,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: TextView(
              text: StringConstant.selfieTagLabel,
              style: TextStyle(
                fontSize: 14,
                color: ColorConstant.secondaryTextColor,
              ),
            ),
          ),
          VerticalSpacer(
            spacing: 16,
          ),
          Center(
            child: AppContainer(
              width: 327,
              height: 380,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: DottedBorder(
                  strokeWidth: 1,
                  dashPattern: [8, 10],
                  color: Colors.blue,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  padding: EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: SvgPicture.asset(fit: BoxFit.contain,
                      AssetPathConstant.logoSvg,
                      height: 380,
                      width: 327,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const TextView(
                text: StringConstant.retakeSelfieButton,
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Visibility(
              child: PrimaryButton(
                text: StringConstant.clickSelfieButton,
                onPressed: () {},
              ),
            ),
          ),
          VerticalSpacer(
            spacing: 10,
          ),
        ],
      ),
    );
  }
}
