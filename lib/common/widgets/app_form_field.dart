
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AppFormField extends StatelessWidget {
  AppFormField({
    Key? key,
    this.width,
    this.height = 60,
    this.onChanged,
    this.hintText,
    this.borderRadius,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.textEditingController,
    BoxConstraints? constraints,
  }) : constraints = (width != null || height != null)
      ? constraints?.tighten(width: width, height: height) ??
      BoxConstraints.tightFor(width: width, height: height)
      : constraints,
        super(key: key);

  final double? width;
  final double? height;
  final Function(String)? onChanged;
  final double? borderRadius;
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BoxConstraints? constraints;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {

    final textFormField = TextFormField(
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
    );

    return Neumorphic(
      child: Container(
        constraints: constraints,
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
