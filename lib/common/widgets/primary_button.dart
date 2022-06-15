import 'package:doctor/constant/color_constant.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
   PrimaryButton({
    Key? key,
    required this.text,
    this.width,
    this.height = 48,
    this.borderRadius,
    this.enabled = true,
    BoxConstraints? constraints,
    required this.onPressed,
  }) : constraints = (width != null || height != null)
      ? constraints?.tighten(width: width, height: height) ??
      BoxConstraints.tightFor(width: width, height: height)
      : constraints,
        super(key: key);

  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final bool enabled;
  final BoxConstraints? constraints;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      child: NeumorphicButton(
        padding: EdgeInsets.zero,
        onPressed: enabled ? onPressed : null,
        style: const NeumorphicStyle(
            color: Colors.transparent,
            depth: 10
        ),
        child: Container(
          decoration: const BoxDecoration(
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
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: enabled ? Colors.white : ColorConstant.lightGreyColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
