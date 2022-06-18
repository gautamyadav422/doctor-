import 'package:doctor/common/widgets/app_container.dart';
import 'package:doctor/common/widgets/app_form_field.dart';
import 'package:doctor/common/widgets/horizontal_spacer.dart';
import 'package:doctor/common/widgets/primary_button.dart';
import 'package:doctor/common/widgets/progeress_indicator.dart';
import 'package:doctor/common/widgets/app_radio.dart';
import 'package:doctor/common/widgets/text_view.dart';
import 'package:doctor/common/widgets/vertical_spacer.dart';
import 'package:doctor/constant/asset_path_constant.dart';
import 'package:doctor/constant/color_constant.dart';
import 'package:doctor/constant/key_constant.dart';
import 'package:doctor/constant/string_constant.dart';
import 'package:doctor/presentation/business_details/controller/busines_details_controller.dart';
import 'package:doctor/route/routes.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BusinessScreen extends StatelessWidget {
  BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<BusinessDetailsController>(
      init: Get.find<BusinessDetailsController>(),
      builder: (controller) => Scaffold(
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
            onPressed: () => Get.offAndToNamed(Routes.signup.name),
          ),
        ),
        backgroundColor: ColorConstant.appBackgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpacer(),
                const PregressIndicator(totalStep: 100, currentStep: 20),
                const VerticalSpacer(
                  spacing: 28,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextView(
                    text: StringConstant.businessDetailsLabel,
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
                    text: StringConstant.nameCardLabel,
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorConstant.secondaryTextColor,
                    ),
                  ),
                ),
                const VerticalSpacer(
                  spacing: 28,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: AppFormField(
                    height: 60,
                    hintText: StringConstant.hospitalNameLabel,
                  ),
                ),
                const VerticalSpacer(
                  spacing: 28,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextView(
                    text: StringConstant.entityTypeLabel,
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorConstant.secondaryTextColor,
                    ),
                  ),
                ),
                const VerticalSpacer(
                  spacing: 8,
                ),
                _dropDownMenuWidget(controller),
                const VerticalSpacer(
                  spacing: 28,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextView(
                    text: StringConstant.businessAddressLabel,
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
                  child: AppFormField(
                    height: 80,
                  ),
                ),
                const VerticalSpacer(
                  spacing: 28,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextView(
                    text: StringConstant.ralationCompanyLabel,
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorConstant.secondaryTextColor,
                    ),
                  ),
                ),
                const VerticalSpacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Wrap(runSpacing: 24, children: [
                    _radioButtonWidget(
                      index: 1,
                      isSelected: true,
                      context,
                      text: "Propritorship",
                    ),
                    const HorizontalSpacer(
                      spacing: 20,
                    ),
                    _radioButtonWidget(
                      index: 2,
                      isSelected: controller.selectedKey.value ==
                          BKeyConstant.partnerKey,
                      context,
                      text: "Partner",
                    ),
                    _radioButtonWidget(
                      index: 3,
                      isSelected: controller.selectedKey.value ==
                          BKeyConstant.directorKey,
                      context,
                      text: "Director",
                    ),
                  ]),
                ),
                const VerticalSpacer(
                  spacing: 28,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextView(
                    text: StringConstant.bPanNoLabel,
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorConstant.secondaryTextColor,
                    ),
                  ),
                ),
                const VerticalSpacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: AppFormField(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AssetPathConstant.gstIcon,
                        color: ColorConstant.iconsButtonColor,
                      ),
                    ),
                  ),
                ),
                const VerticalSpacer(spacing: 22),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: TextView(
                    text: StringConstant.gstNoLabel,
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorConstant.secondaryTextColor,
                    ),
                  ),
                ),
                const VerticalSpacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: AppFormField(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AssetPathConstant.gstIcon,
                        color: ColorConstant.iconsButtonColor,
                      ),
                    ),
                  ),
                ),
                const VerticalSpacer(
                  spacing: 28,
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
                      Expanded(
                          child: TextView(text: StringConstant.checkboxLabel)),
                    ],
                  ),
                ),
                const VerticalSpacer(
                  spacing: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Visibility(
                    child: PrimaryButton(
                      text: StringConstant.nextButtonLabel,
                      onPressed: () {},
                    ),
                  ),
                ),
                const VerticalSpacer(
                  spacing: 55,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _radioButtonWidget(
    BuildContext context, {
    required String text,
    required bool isSelected,
    required int index,
  }) {
    return AppContainer(
      height: 60,
      width: MediaQuery.of(context).size.width / 2.5,
      child: GetX<BusinessDetailsController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.only(top: 18, left: 10),
          child: Row(
            children: [
              RadioContainer(
                  isSelected: controller.selectedIndex.value == index,
                  onPressed: () {
                    final signupController =
                        Get.find<BusinessDetailsController>();
                    signupController.changeTab(index);
                  }),
              const HorizontalSpacer(
                spacing: 15,
              ),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }

  Padding _dropDownMenuWidget(BusinessDetailsController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AppContainer(
        height: 60,
        child: DropdownButton2(
          underline: const SizedBox.shrink(),
          dropdownFullScreen: true,
          isExpanded: true,
          hint: Row(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextView(
                  text: StringConstant.selectentityLabel,
                  style: TextStyle(
                      fontSize: 16, color: ColorConstant.dropdownColor),
                ),
              ),
            ],
          ),
          items: controller.items
              .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: TextView(
                    text: item,
                    style: const TextStyle(
                        fontSize: 16, color: ColorConstant.primaryTextColor),
                  )))
              .toList(),
          value: controller.selectedValue,
          onChanged: (value) {
            // controller.selectedValue
          },

          icon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                AssetPathConstant.dropDownIcon,
                color: ColorConstant.iconsButtonColor,
              ),
            ),
          ),
          iconSize: 14,
          iconEnabledColor: Colors.yellow,
          iconDisabledColor: Colors.grey,
          buttonHeight: 50,
          buttonElevation: 2,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 300,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: ColorConstant.appBackgroundColor,
          ),
          dropdownElevation: 8, dropdownOverButton: false,

          // scrollbarAlwaysShow: false,
          offset: const Offset(0, -20),
        ),
      ),
    );
  }
}
