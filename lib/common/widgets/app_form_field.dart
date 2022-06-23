import 'package:doctor/common/widgets/text_view.dart';
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
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.obscuringCharacter = '●',
    this.focusNode,
    this.autofocus = false,
    this.autocorrect = false,
    this.textEditingController,
    this.readOnly = false,
    this.textCapitalization=TextCapitalization.none,
    this.validator,

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
  final int? maxLength;
  final TextAlign textAlign;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String  obscuringCharacter;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool autocorrect;
  final bool readOnly;
  final BoxConstraints? constraints;
  final TextEditingController? textEditingController;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Neumorphic(
          child: GestureDetector(
            child: Container(
              constraints: constraints,
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextFormField(
                textAlign: textAlign,
                onChanged: onChanged,
                keyboardType: keyboardType,
                controller: textEditingController,
                focusNode: focusNode,
                autofocus: autofocus,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 20, bottom: 20),
                  border: InputBorder.none,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: hintText ?? '',
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  counterText: '',

                ),
                //textCapitalization: textCapitalization,
                obscureText: obscureText,
                obscuringCharacter: obscuringCharacter,
                maxLength: maxLength,
                textCapitalization: textCapitalization,
                validator: validator,
              ),
            ),
          ),
        ),


        //TextView(text: "kkk")
      ],
    );
  }
}
