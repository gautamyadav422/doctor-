import 'package:doctor/common/widgets/app_form_field.dart';
import 'package:doctor/util/log.dart';
import 'package:flutter/material.dart';

class OTPFields extends StatefulWidget {
  const OTPFields({
    Key? key,
    this.length = 4,
    this.width = 60,
    this.height = 60,
    this.borderRadius = 8,
    this.keyboardType = TextInputType.number,
    this.obscureText = true,
    this.obscuringCharacter = '●',
    this.enabled = true,
    this.focusNode,
    this.onChanged,
    this.onCompleted,
    this.controller,
    this.autoDismissKeyboard = true,
    this.autoDisposeControllers = true,
  }) : super(key: key);

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

  /// you already know what it does i guess :P default is false
  final bool obscureText;

  /// Default is ● - 'Black Circle' (U+25CF)
  final String obscuringCharacter;

  final bool enabled;

  /// Should pass a [FocusNode] to manage it from the parent
  final FocusNode? focusNode;

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

  @override
  _OTPFieldsState createState() => _OTPFieldsState();
}

class _OTPFieldsState extends State<OTPFields> with TickerProviderStateMixin{

  TextEditingController? _textEditingController;
  FocusNode? _focusNode;
  late List<String> _inputList;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _assignController();
    _focusNode = widget.focusNode ?? FocusNode();
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

    if (mounted)
      setState(() {
        _selectedIndex = data.length;
        _inputList = replaceInputList;
      });
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
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _generateFields(),
      ),
    );
  }

  List<Widget> _generateFields() {
    final list = <Widget>[];
    for (var i = 0; i < widget.length; i++) {
      list.add(
        AppFormField(
          width: widget.width,
          height: widget.height,
          textAlign: TextAlign.center,
          obscureText: widget.obscureText,
          obscuringCharacter: widget.obscuringCharacter,
          keyboardType: widget.keyboardType,
          maxLength: 1,
          autocorrect: false,
        ),
      );
    }

    return list;
  }
}

enum OTPFieldShape { box, circle }
