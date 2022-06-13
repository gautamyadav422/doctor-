import 'package:doctor/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextView extends StatelessWidget {
  const TextView({
    required this.text,
    this.textAlign,
    this.style,
    Key? key,
  }) : super(key: key);

  final String? text;
  final TextAlign? textAlign;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: GoogleFonts.poppins(
        fontSize: style?.fontSize ?? 12,
        fontWeight: style?.fontWeight ?? FontWeight.normal,
        color: style?.color ?? ColorConstant.primaryTextColor
      ),
    );
  }
}
