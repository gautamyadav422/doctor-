import 'package:doctor/common/widgets/app_container.dart';
import 'package:doctor/common/widgets/app_form_field.dart';
import 'package:doctor/util/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPFields extends StatefulWidget {
  const OTPFields({
    Key? key,
    required this.appContext,
    this.length = 4,
    this.width = 60,
    this.height = 60,
    this.borderRadius = 8,
    this.keyboardType = TextInputType.number,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.obscureText = true,
    this.obscuringCharacter = '●',
    this.enabled = true,
    this.focusNode,
    this.autoUnfocus = true,
    this.onChanged,
    this.onCompleted,
    this.controller,
    this.blinkWhenObscuring = false,
    this.blinkDuration = const Duration(milliseconds: 500),
    this.textStyle,
    this.autoDismissKeyboard = true,
    this.autoDisposeControllers = true,
    this.onAutoFillDisposeAction = AutofillContextAction.commit,
  }) : super(key: key);


  /// build context
  final BuildContext appContext;

  /// length of how many cells there should be. 3-8 is recommended by me
  final int length;

  /// width of the field
  final double width;

  /// height of the field
  final double height;

  /// border radius
  final double borderRadius;

  /// keyboard type
  final TextInputType keyboardType;

  /// This defines how the elements in the pin code field align. Default to [MainAxisAlignment.spaceBetween]
  final MainAxisAlignment mainAxisAlignment;

  /// you already know what it does i guess :P default is false
  final bool obscureText;

  /// Default is ● - 'Black Circle' (U+25CF)
  final String obscuringCharacter;

  final bool enabled;

  /// Should pass a [FocusNode] to manage it from the parent
  final FocusNode? focusNode;

  /// Enable auto unfocus
  final bool autoUnfocus;

  /// Decides whether typed character should be
  /// briefly shown before being obscured
  final bool blinkWhenObscuring;

  /// Blink Duration if blinkWhenObscuring is set to true
  final Duration blinkDuration;

  /// the style of the text, default is [ fontSize: 20, fontWeight: FontWeight.bold]
  final TextStyle? textStyle;

  /// returns the current typed text in the fields
  final ValueChanged<String>? onChanged;

  /// returns the typed text when all pins are set
  final ValueChanged<String>? onCompleted;

  /// [TextEditingController] to control the text manually. Sets a default [TextEditingController()] object if none given
  final TextEditingController? controller;

  /// Auto dismiss the keyboard upon inputting the value for the last field. Default is [true]
  final bool autoDismissKeyboard;

  /// Auto dispose the [controller] and [FocusNode] upon the destruction of widget from the widget tree. Default is [true]
  final bool autoDisposeControllers;

  /// Autofill cleanup action
  final AutofillContextAction onAutoFillDisposeAction;

  @override
  _OTPFieldsState createState() => _OTPFieldsState();
}

class _OTPFieldsState extends State<OTPFields> with TickerProviderStateMixin {
  TextEditingController? _textEditingController;
  FocusNode? _focusNode;
  late List<String> _inputList;
  int _selectedIndex = 0;
  // Whether the character has blinked
  bool _hasBlinked = false;

  TextStyle get _textStyle => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ).merge(widget.textStyle);

  @override
  void initState() {
    super.initState();
    _assignController();
    _hasBlinked = true;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode!.addListener(() {
      setState(() {});
    }); // Rebuilds on every change to reflect the correct color on each field.
    _inputList = List<String>.filled(widget.length, "");
    _focusNode!.addListener(() {
      setState(() {});
    });
    // If a default value is set in the TextEditingController, then set to UI
    if (_textEditingController!.text.isNotEmpty) {
      _setTextToInput(_textEditingController!.text);
    }
  }

  // Assigning the text controller, if empty assiging a new one.
  void _assignController() {
    if (widget.controller == null) {
      _textEditingController = TextEditingController();
    } else {
      _textEditingController = widget.controller;
    }

    _textEditingController?.addListener(() {
      var currentText = _textEditingController!.text;

      if (widget.enabled && _inputList.join("") != currentText) {
        if (currentText.length >= widget.length) {
          if (widget.onCompleted != null) {
            if (currentText.length > widget.length) {
              // removing extra text longer than the length
              currentText = currentText.substring(0, widget.length);
            }
            //  delay the onComplete event handler to give the onChange event handler enough time to complete
            Future.delayed(const Duration(milliseconds: 300),
                () => widget.onCompleted!(currentText));
          }

          if (widget.autoDismissKeyboard) _focusNode!.unfocus();
        }
        if (widget.onChanged != null) {
          widget.onChanged!(currentText);
        }
      }

      _setTextToInput(currentText);
    });
  }

  void _setTextToInput(String data) async {
    var replaceInputList = List<String>.filled(widget.length, "");

    for (int i = 0; i < widget.length; i++) {
      replaceInputList[i] = data.length > i ? data[i] : "";
    }

    if (mounted) {
      setState(() {
        _selectedIndex = data.length;
        _inputList = replaceInputList;
      });
    }
  }

  @override
  void dispose() {
    if (widget.autoDisposeControllers) {
      _textEditingController!.dispose();
      _focusNode!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textField = TextFormField(
      controller: _textEditingController,
      focusNode: _focusNode,
      enabled: widget.enabled,
      autocorrect: false,
      keyboardType: widget.keyboardType,
      inputFormatters: [
        LengthLimitingTextInputFormatter(
          widget.length,
        ), // this limits the input length
      ],
      enableInteractiveSelection: false,
      showCursor: false,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(0),
        border: InputBorder.none,
        fillColor: Colors.transparent,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );

    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AbsorbPointer(
            absorbing: true,
            child: AutofillGroup(
              onDisposeAction: widget.onAutoFillDisposeAction,
              child: textField,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                _onFocus();
              },
              child: Row(
                mainAxisAlignment: widget.mainAxisAlignment,
                children: _generateFields(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onFocus() {
    if (widget.autoUnfocus) {
      if (_focusNode!.hasFocus &&
          MediaQuery.of(widget.appContext).viewInsets.bottom == 0) {
        _focusNode!.unfocus();
        Future.delayed(
            const Duration(microseconds: 1), () => _focusNode!.requestFocus());
      } else {
        _focusNode!.requestFocus();
      }
    } else {
      _focusNode!.requestFocus();
    }
  }

  List<Widget> _generateFields() {
    final list = <Widget>[];
    for (var i = 0; i < widget.length; i++) {
      list.add(
        AppContainer(
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          child: _buildChild(i),
        )
      );
    }

    return list;
  }

  Widget _buildChild(int index) {
    return _renderPinField(
      index: index,
    );
  }

  Widget _renderPinField({
    required int index,
  }) {

    bool showObscured = !widget.blinkWhenObscuring ||
        (widget.blinkWhenObscuring && _hasBlinked) ||
        index != _inputList.where((x) => x.isNotEmpty).length - 1;

    final text =
    widget.obscureText && _inputList[index].isNotEmpty && showObscured
        ? widget.obscuringCharacter
        : _inputList[index];
    return Text(
      text,
      key: ValueKey(_inputList[index]),
      style: _textStyle,
    );
  }
}

enum OTPFieldShape { box, circle }
