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
import 'package:doctor/constant/key_constant.dart';
import 'package:doctor/constant/string_constant.dart';
import 'package:doctor/model/entity_response.dart';
import 'package:doctor/presentation/business_details/controller/busines_details_controller.dart';
import 'package:doctor/route/routes.dart';
import 'package:doctor/util/snack_bar_util.dart';
import 'package:doctor/util/string_util.dart';
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
        appBar: CustomAppBar(
            onPressed: () {
              Get.offAndToNamed(Routes.login.name);
            },
            imagePath: AssetPathConstant.backIcon),
        backgroundColor: ColorConstant.appBackgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: AppForm(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacer(),
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
                    spacing: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: AppFormField(
                      height: 60,
                      hintText: StringConstant.nameCardHintLabel,
                      textEditingController:
                          controller.nameTextEditingController,
                      autofocus: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return StringConstant.cardNameErrorMsgLabel;
                        }
                        return null;
                      },
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
                  const VerticalSpacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: AppFormField(
                      height: 80,
                      hintText: StringConstant.addressHintLabel,
                      textEditingController:
                          controller.addressTextEditingController,
                      autofocus: false,
                      focusNode: FocusNode(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return StringConstant.addressErrorMsgLabel;
                        }
                        return null;
                      },
                    ),
                  ),
                  const VerticalSpacer(
                    spacing: 10,
                  ),
                  const VerticalSpacer(
                    spacing: 28,
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
                      hintText: StringConstant.bPinHintLabel,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      textEditingController:
                          controller.pinCodeTextEditingController,
                      autofocus: false,
                      focusNode: FocusNode(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return StringConstant.pinErrorMsgLabel;
                        } else if (value.length != 6) {
                          return StringConstant.pinErrorMsgLabel;
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const VerticalSpacer(
                    spacing: 28,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: controller.selectedEntityValue.value.enityName !=
                                "INDIVIDUAL" &&
                            controller.selectedEntityValue.value.enityName !=
                                "PROPRIETOR"
                        ? const TextView(
                            text: StringConstant.bPanNoLabel,
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorConstant.secondaryTextColor,
                            ),
                          )
                        : const TextView(
                            text: StringConstant.bPanPersonalNoLabel,
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
                      hintText: controller
                                      .selectedEntityValue.value.enityName !=
                                  "INDIVIDUAL" &&
                              controller.selectedEntityValue.value.enityName !=
                                  "PROPRIETOR"
                          ? StringConstant.bPanNoHintLabel
                          : StringConstant.bPanPersonalNoHintLabel,
                      maxLength: 10,
                      textEditingController:
                          controller.panNoTextEditingController,
                      textCapitalization: TextCapitalization.characters,
                      autofocus: false,
                      focusNode: FocusNode(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return StringConstant.panErrorMsgLabel;
                        } else if (value.length != 10) {
                          return StringConstant.panErrorMsgLabel;
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const VerticalSpacer(spacing: 22),

                  //   _buildGSTNoField(controller),

                  Visibility(
                    visible: controller.selectedEntityValue.value.enityName !=
                                "INDIVIDUAL" &&
                            controller.selectedEntityValue.value.enityName !=
                                "PROPRIETOR"
                        ? true
                        : false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            hintText: StringConstant.gstNoHintLabel,
                            maxLength: 15,
                            textEditingController:
                                controller.gstNoTextEditingController,
                            textCapitalization: TextCapitalization.characters,
                            autofocus: false,
                            focusNode: FocusNode(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return StringConstant.gstErrorMsgLabel;
                              } else if (value.length != 15) {
                                return StringConstant.gstErrorMsgLabel;
                              } else {
                                return null;
                              }
                            },
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
                          if (controller.formKey.currentState!.validate()) {
                            if (controller
                                    .selectedEntityValue.value.enityName ==
                                StringConstant.selectentityLabel) {
                              Utils.showToast(StringConstant.selectentityLabel);
                            } else if (controller.selectAddressValue.value ==
                                StringConstant.selectAddressLabel) {
                              Utils.showToast(
                                  StringConstant.selectAddressLabel);
                            } else {
                              controller.panVerify();
                            }
                          }
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

  Padding _dropDownMenuWidget(BusinessDetailsController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AppContainer(
        height: 60,
        child: GetX<BusinessDetailsController>(
          builder: (controller) => DropdownButton2<Entity>(
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
            items: controller.entityList
                .map((item) => DropdownMenuItem<Entity>(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextView(
                        text: item.enityName,
                        style: const TextStyle(
                            fontSize: 16,
                            color: ColorConstant.primaryTextColor),
                      ),
                    )))
                .toList(),
            value: controller.selectedEntityValue.value,
            onChanged: (value) {
              if (value != null) {
                controller.selectedEntityValue.value = value;
              }
            },
            iconOnClick: GestureDetector(
              onTap: () {
                controller.arrowState.value = !controller.arrowState.value;
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
            dropdownElevation: 8,
            dropdownOverButton: false,

            // scrollbarAlwaysShow: false,
            offset: const Offset(0, -20),
          ),
        ),
      ),
    );
  }

  Padding _dropDownMenuWidgetAddress(BusinessDetailsController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AppContainer(
        height: 60,
        child: DropdownButton2<String>(
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextView(
                      text: item,
                      style: const TextStyle(
                          fontSize: 16, color: ColorConstant.primaryTextColor),
                    ),
                  )))
              .toList(),
          value: controller.selectAddressValue.value,
          onChanged: (value) {
            if (value != null) {
              controller.selectAddressValue.value = value;
            }
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
          dropdownElevation: 8,
          dropdownOverButton: false,

          // scrollbarAlwaysShow: false,
          offset: const Offset(0, -20),
        ),
      ),
    );
  }
}
