import 'package:doctor/common/widgets/app_container.dart';
import 'package:doctor/common/widgets/app_form_field.dart';
import 'package:doctor/common/widgets/custom_appbar.dart';
import 'package:doctor/common/widgets/horizontal_spacer.dart';
import 'package:doctor/common/widgets/primary_button.dart';
import 'package:doctor/common/widgets/progeress_indicator.dart';
import 'package:doctor/common/widgets/app_radio.dart';
import 'package:doctor/common/widgets/text_view.dart';
import 'package:doctor/common/widgets/vertical_spacer.dart';
import 'package:doctor/constant/asset_path_constant.dart';
import 'package:doctor/constant/color_constant.dart';
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
        key: controller.signupScreenPageGolbalKey,
        appBar: CustomAppBar(
            onPressed: () {
              Get.offAndToNamed(Routes.login.name);
            },
            imagePath: AssetPathConstant.backIcon),
        backgroundColor: ColorConstant.appBackgroundColor,
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacer(),
                  const PregressIndicator(totalStep: 100, currentStep: 20),
                  const VerticalSpacer(
                    spacing: 24,
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
                    spacing: 24,
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
                    spacing: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: AppFormField(
                      height: 60,
                    ),
                  ),
                  const VerticalSpacer(
                    spacing: 24,
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
                    spacing: 24,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: TextView(
                      text: StringConstant.addressTypeLabel,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorConstant.secondaryTextColor,
                      ),
                    ),
                  ),
                  const VerticalSpacer(
                    spacing: 8,
                  ),

                  _dropDownMenuWidgetAddress(controller),
                  const VerticalSpacer(
                    spacing: 24,
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
                  const VerticalSpacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: AppFormField(
                      height: 80,
                    ),
                  ),
                  const VerticalSpacer(
                    spacing: 10,
                  ),

                  const VerticalSpacer(
                    spacing: 24,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: TextView(
                      text: StringConstant.bPinLableLabel,
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
                    ),
                  ),

                  const VerticalSpacer(
                    spacing: 24,
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
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(8.0),
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
                            text: StringConstant.checkboxLabel,
                          ),
                        ),
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
                        onPressed: () {
                          // Get.offAndToNamed(Routes.hospitalDetails.name);
                        },
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
      ),
    );
  }

/*
  Widget _radioButtonWidget(
    BuildContext context, {
    required String text,
    required bool isSelected,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        final businessController = Get.find<BusinessDetailsController>();
        businessController.changeRadio(index);
      },
      child: AppContainer(
        height: 60,
        width: MediaQuery.of(context).size.width / 2.5,
        child: GetX<BusinessDetailsController>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.only(top: 18, left: 10),
            child: Row(
              children: [
                RadioContainer(
                  isSelected: controller.selectedIndex.value == index,
                  child: const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                ),
                const HorizontalSpacer(
                  spacing: 15,
                ),
                TextView(
                  text: text,
                  style: const TextStyle(
                      fontSize: 16, color: ColorConstant.primaryTextColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
*/

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
             controller.selectedValue;
          },
          iconOnClick: GestureDetector(
            onTap: () {
              controller.arrowState.value = !controller.arrowState.value;
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AssetPathConstant.upIcon,
                  height: 10,
                  color: ColorConstant.iconsButtonColor,
                ),
              ),
            ),
          ),
          icon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                height: 20,
                AssetPathConstant.downIcon,
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



  Padding _dropDownMenuWidgetAddress(BusinessDetailsController controller) {
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
                  text: StringConstant.selectAddressLabel,
                  style: TextStyle(
                      fontSize: 16, color: ColorConstant.dropdownColor),
                ),
              ),
            ],
          ),
          items: controller.addressItems
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
          iconOnClick: GestureDetector(
            onTap: () {
              controller.arrowState.value = !controller.arrowState.value;
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AssetPathConstant.upIcon,
                  height: 10,
                  color: ColorConstant.iconsButtonColor,
                ),
              ),
            ),
          ),
          icon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                height: 20,
                AssetPathConstant.downIcon,
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
