import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AppContainer extends StatelessWidget {
  AppContainer({
    Key? key,
    this.width,
    this.height,
    this.borderRadius = 8,
    this.alignment = Alignment.topLeft,
    this.style,
    this.child,
    BoxConstraints? constraints,
  })  : constraints = (width != null || height != null)
            ? constraints?.tighten(width: width, height: height) ??
                BoxConstraints.tightFor(width: width, height: height)
            : constraints,
        super(key: key);

  final double? width;
  final double? height;
  final double borderRadius;
  final Alignment alignment;
  final NeumorphicStyle? style;
  final BoxConstraints? constraints;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: style,
      child: Container(
        constraints: constraints,
        alignment: alignment,
        child: child,
      ),
    );
  }
}
