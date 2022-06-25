import 'package:doctor/common/widgets/vertical_spacer.dart';
import 'package:doctor/constant/color_constant.dart';
import 'package:doctor/common/widgets/text_view.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class AppForm extends StatefulWidget {
  const AppForm({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  static AppFormState? of(BuildContext context) {
    final _AppFormScope? scope =
        context.dependOnInheritedWidgetOfExactType<_AppFormScope>();
    return scope?._formState;
  }

  @override
  AppFormState createState() => AppFormState();
}

class AppFormState extends State<AppForm> {
  final Set<AppFormFieldState> _fields = <AppFormFieldState>{};

  void _register(AppFormFieldState field) {
    _fields.add(field);
  }

  void _unregister(AppFormFieldState field) {
    _fields.remove(field);
  }

  bool validate() {
    final isValid = !_validate();
    return isValid;
  }

  bool _validate() {
    bool hasError = false;
    for (AppFormFieldState field in _fields) {
      hasError = !field.validate() || hasError;
    }
    return hasError;
  }

  @override
  Widget build(BuildContext context) {
    return _AppFormScope(
      formState: this,
      child: widget.child,
    );
  }
}

class _AppFormScope extends InheritedWidget {
  const _AppFormScope({
    Key? key,
    required Widget child,
    required AppFormState formState,
  })  : _formState = formState,
        super(key: key, child: child);

  final AppFormState _formState;

  AppForm get form => _formState.widget;

  @override
  bool updateShouldNotify(covariant _AppFormScope oldWidget) {
    return true;
  }
}

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
    this.textCapitalization = TextCapitalization.none,
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
  var _hasError = false;

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
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
  void deactivate() {
    AppForm.of(context)?._unregister(this);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    AppForm.of(context)?._register(this);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Neumorphic(
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
              decoration: hasFocus || isNotEmpty
                  ? null
                  : const BoxDecoration(
                      gradient: ColorConstant.emptyFieldGradient,
                    ),
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextFormField(
                textAlign: widget.textAlign,
                onChanged: _onChange,
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
                    counterText: ''),
                obscureText: widget.obscureText,
                obscuringCharacter: widget.obscuringCharacter,
                maxLength: widget.maxLength,
                validator: widget.validator,
              ),
            ),
          ),
        ),
        const VerticalSpacer(spacing: 4),
        _errorWidget(),
      ],
    );
  }

  Widget _errorWidget() {
    return _hasError
        ? TextView(
            text: getErrorText(),
            style: const TextStyle(
              color: Colors.red,
              fontSize: 13,
            ),
          )
        : Container();
  }

  void _onChange(String text) {
    setState(() {
      isNotEmpty = text.isNotEmpty;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(text);
    }
  }

  String getErrorText() {
    final initialValue = widget.textEditingController != null
        ? widget.textEditingController!.text
        : '';
    return widget.validator != null && widget.validator!(initialValue) != null
        ? widget.validator!(initialValue)!
        : '';
  }

  bool validate() {
    final initialValue = widget.textEditingController != null
        ? widget.textEditingController!.text
        : '';
    bool isValid = widget.validator!(initialValue) == null;
    if (widget.validator != null) {
      setState(() {
        _hasError = !isValid;
      });
      return isValid;
    }

    return true;
  }
}
