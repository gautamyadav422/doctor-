import 'package:doctor/common/widgets/app_container.dart';
import 'package:doctor/common/widgets/custom_appbar.dart';
import 'package:doctor/common/widgets/horizontal_spacer.dart';
import 'package:doctor/common/widgets/primary_button.dart';
import 'package:doctor/common/widgets/text_view.dart';
import 'package:doctor/common/widgets/vertical_spacer.dart';
import 'package:doctor/constant/asset_path_constant.dart';
import 'package:doctor/constant/color_constant.dart';
import 'package:doctor/constant/string_constant.dart';
import 'package:doctor/presentation/hospital_details/controller/hospital_details_controller.dart';
import 'package:doctor/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HospitalDetailsScreen extends StatelessWidget {
  HospitalDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HospitalDetailsController>(
      builder: (controller) => Scaffold(
        appBar: CustomAppBar(
          onPressed: () {
            Get.offAndToNamed(Routes.businesDetail.name);
          },
          imagePath: AssetPathConstant.backIcon,
        ),
        backgroundColor: ColorConstant.appBackgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpacer(
                  spacing: 55,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextView(
                    text: StringConstant.hospitalDetailsLabel,
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
                    text: StringConstant.selectProfileLabel,
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorConstant.secondaryTextColor,
                    ),
                  ),
                ),
                const VerticalSpacer(
                  spacing: 28,
                ),
                _expandableTabWidget(context, StringConstant.individualLabel),
                const VerticalSpacer(
                  spacing: 24,
                ),
                _partnerTabWidget(context, StringConstant.partnerLabel),
                const VerticalSpacer(
                  spacing: 46,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const TextView(
                      text: StringConstant.changeDetailsButton,
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const VerticalSpacer(
                  spacing: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      NeumorphicCheckbox(
                        padding: const EdgeInsets.all(2),
                        value: true,
                        onChanged: (newValue) {},
                        style: const NeumorphicCheckboxStyle(
                          selectedColor: Colors.blue,
                          unselectedDepth: 1,
                          selectedDepth: 0.1,
                        ),
                      ),
                      const HorizontalSpacer(
                        spacing: 10,
                      ),
                      const Expanded(
                        child: TextView(
                          text: StringConstant.hospitalCheckLabel,
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalSpacer(
                  spacing: 28,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Visibility(
                    child: PrimaryButton(
                      text: StringConstant.confirmDetailsButton,
                      onPressed: () {},
                    ),
                  ),
                ),
                const VerticalSpacer(
                  spacing: 38,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _expandableTabWidget(
    BuildContext context,
    String text,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AppContainer(
        child: GetX<HospitalDetailsController>(
          builder: (controller) => Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              onExpansionChanged: (bool expanding) {
                controller.individualState.value = expanding;
              },
              trailing: controller.individualState.value
                  ? AppContainer(
                      width: 40,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          AssetPathConstant.downIcon,
                          color: ColorConstant.iconsButtonColor,
                        ),
                      ),
                    )
                  : AppContainer(
                      width: 40,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          AssetPathConstant.forwardIcon,
                          color: ColorConstant.iconsButtonColor,
                        ),
                      ),
                    ),
              title: TextView(
                text: text,
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorConstant.primaryTextColor,
                ),
              ),
              childrenPadding: const EdgeInsets.all(10),
              initiallyExpanded: false,
              children: [
                const VerticalSpacer(
                  spacing: 28,
                ),
                _hospitalContainerWidget(
                  hnamelabel: StringConstant.hospitalName1Label,
                  hospitallabel: "Wockhardt Hospital",
                ),
                const VerticalSpacer(
                  spacing: 24,
                ),
                _hospitalContainerWidget(
                  hnamelabel: StringConstant.contactNumberLabel,
                  hospitallabel: "+91 9876543210",
                ),
                const VerticalSpacer(
                  spacing: 24,
                ),
                _hospitalContainerWidget(
                  hnamelabel: StringConstant.addressLabel,
                  hospitallabel:
                      "Plot No.:A-15, Sreepati Complex Bandra East - 400 001",
                ),
                const VerticalSpacer(
                  spacing: 24,
                ),
                _hospitalContainerWidget(
                  hnamelabel: StringConstant.panNumberLabel,
                  hospitallabel: "BVYGA24630",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _partnerTabWidget(
    BuildContext context,
    String text,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GetX<HospitalDetailsController>(
        builder: (controller) => Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: AppContainer(
            child: ExpansionTile(
              onExpansionChanged: (bool expanding) {
                controller.partnerState.value = expanding;
              },
              trailing: controller.partnerState.value
                  ? AppContainer(
                      width: 40,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          AssetPathConstant.downIcon,
                          color: ColorConstant.iconsButtonColor,
                        ),
                      ),
                    )
                  : AppContainer(
                      width: 40,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          AssetPathConstant.forwardIcon,
                          color: ColorConstant.iconsButtonColor,
                        ),
                      ),
                    ),
              title: TextView(
                text: text,
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorConstant.primaryTextColor,
                ),
              ),
              childrenPadding: const EdgeInsets.all(10),
              initiallyExpanded: false,
              children: [
                const VerticalSpacer(
                  spacing: 28,
                ),
                _hospitalContainerWidget(
                  hnamelabel: StringConstant.hospitalName1Label,
                  hospitallabel: "Wockhardt Hospital",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _hospitalContainerWidget({required String hnamelabel, hospitallabel}) {
    return AppContainer(
      height: 85,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: hnamelabel,
              style: const TextStyle(
                fontSize: 14,
                color: ColorConstant.secondaryTextColor,
              ),
            ),
            const VerticalSpacer(),
            Expanded(
              child: TextView(
                text: hospitallabel,
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorConstant.primaryTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
