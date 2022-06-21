import 'package:doctor/common/widgets/app_container.dart';
import 'package:doctor/common/widgets/app_form_field.dart';
import 'package:doctor/common/widgets/horizontal_spacer.dart';
import 'package:doctor/common/widgets/progeress_indicator.dart';
import 'package:doctor/common/widgets/selectable_container.dart';
import 'package:doctor/common/widgets/text_view.dart';
import 'package:doctor/common/widgets/vertical_spacer.dart';
import 'package:doctor/constant/asset_path_constant.dart';
import 'package:doctor/constant/color_constant.dart';
import 'package:doctor/constant/key_constant.dart';
import 'package:doctor/constant/string_constant.dart';
import 'package:doctor/presentation/aadhaar_verify/controller/aadhaar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AadhaarScreen extends StatelessWidget {
  const AadhaarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AadhaarController>(
      init: Get.find<AadhaarController>(),
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
        backgroundColor: ColorConstant.appBackgroundColor,
        body: SafeArea(
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
                  text: StringConstant.aadhaarLable,
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
                  text: StringConstant.aadhaarDecsLable,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const VerticalSpacer(
                spacing: 28,
              ),
              _selectableTab(
                index: 1,
                isSelected: controller.selectedKey.value ==
                    KeyConstant.verifyAadhaarKey,
                text: StringConstant.verifyAadhaar,
              ),
              const VerticalSpacer(
                spacing: 28,
              ),
              _selectableTab(
                index: 2,
                isSelected: controller.selectedKey.value ==
                    KeyConstant.uploadAadhaarKey,
                text: StringConstant.signupAsLabel,
              ),

              //_buildAadhaarUploadField(controller),
            ],
          ),
        ),
      ),
    );
  }

/*
  Widget _buildAadhaarUploadField(AadhaarController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AppContainer(
          height: 60,
          child: const Center(
            child:  TextView(
              text: StringConstant.uploadAadhaar,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),



      ),
    );
  }


  Widget _buildAadhaarVerifyField(AadhaarController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AppContainer(
        height: 60,
        child: const Center(
          child:  TextView(
            text: StringConstant.verifyAadhaar,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),



      ),
    );
  }
*/

  Widget _selectableTab(
      {String? text,
      required bool isSelected,
      required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GetX<AadhaarController>(
        builder: (controller) => SelectableContainer(
          key: key,
          isSelected: controller.selectedIndex.value == index,
          onPressed: () {
            final aadhaarController = Get.find<AadhaarController>();
            aadhaarController.changeTab(index);
          },
          height: 52,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: TextView(
                text: text,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
