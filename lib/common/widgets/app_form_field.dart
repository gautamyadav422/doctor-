import 'package:doctor/constant/color_constant.dart';
import 'package:doctor/common/widgets/text_view.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFormField extends StatefulWidget {
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
  })  : constraints = (width != null || height != null)
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
  final String obscuringCharacter;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool autocorrect;
  final bool readOnly;
  final BoxConstraints? constraints;
  final TextEditingController? textEditingController;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;


  @override
  AppFormFieldState createState() => AppFormFieldState();
}

class AppFormFieldState extends State<AppFormField> {
  var isNotEmpty = false;
  var hasFocus = false;

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      print('HasFocus: ${_focusNode.hasFocus}');
      setState(() {
        hasFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: hasFocus || isNotEmpty
          ? const NeumorphicStyle(
              lightSource: LightSource.topLeft,
              depth: 5,
              intensity: 0.9,
            )
          : const NeumorphicStyle(
              lightSource: LightSource.topLeft,
              depth: 2,
              intensity: 1,
            ),
      child: GestureDetector(
        child: Container(
          constraints: widget.constraints,
          decoration: hasFocus || isNotEmpty ? null : const BoxDecoration(
            gradient: ColorConstant.emptyFieldGradient,
          ),
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: TextFormField(
            textAlign: widget.textAlign,
            onChanged: onChange,
            keyboardType: widget.keyboardType,
            controller: widget.textEditingController,
            focusNode: _focusNode,
            autofocus: widget.autofocus,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 20, bottom: 20),
              border: InputBorder.none,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              hintText: widget.hintText ?? '',
              hintStyle: GoogleFonts.poppins(
                  color: ColorConstant.hintColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              counterText: '',
            ),
            obscureText: widget.obscureText,
            obscuringCharacter: widget.obscuringCharacter,
            maxLength: widget.maxLength,
            validator: widget.validator,
          ),
        ),
      ),
    );
  }

  void onChange(String text) {
    setState(() {
      isNotEmpty = text.isNotEmpty;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(text);
    }
  }
}
