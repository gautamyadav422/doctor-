import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:gmoney/constant/color_constant.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    this.width,
    this.height,
    this.borderRadius,
    this.enabled = true,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool enabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 48,
      child: NeumorphicButton(
        padding: EdgeInsets.zero,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ColorConstant.primaryButtonStartColor,
                    ColorConstant.primaryButtonEndColor
                  ]
              )
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: enabled ? Colors.white : ColorConstant.lightGreyColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        onPressed: enabled ? onPressed : null,
        style: NeumorphicStyle(
          color: Colors.transparent,
          depth: 10
        ),
      ),
    );
  }
}
