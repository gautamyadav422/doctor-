import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gmoney/constant/color_constant.dart';

class AppFormField extends StatelessWidget {
  const AppFormField({
    Key? key,
    this.width,
    this.height,
    this.onChanged,
    this.hintText,
    this.borderRadius,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.textEditingController,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Function(String)? onChanged;
  final double? borderRadius;
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 60,
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: TextFormField(
          onChanged: onChanged,
          keyboardType: keyboardType,
          controller: textEditingController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 20, bottom: 20),
            border: InputBorder.none,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: hintText ?? '',
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
