import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class RadioContainer extends StatelessWidget {
  RadioContainer({
    Key? key,
    this.width,
    this.height,
    this.borderRadius = 8,
    this.alignment = Alignment.topLeft,
    this.isSelected = false,
     this.onPressed,
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
  final bool isSelected;
  final BoxConstraints? constraints;
  final Widget? child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: onPressed,
        child: Neumorphic(
          style: _getStyle(),
          child: child,
        ),
      ),
    );
  }

  NeumorphicStyle _getStyle() {
    if (isSelected) {
      return const NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        lightSource: LightSource.topLeft,
        depth: 5,
        intensity: 0.9,
        shape: NeumorphicShape.convex,
        color: Colors.blue,
        border: NeumorphicBorder(
          color: Colors.white,
          width: 4,
        ),
      );
    } else {
      return const NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        lightSource: LightSource.topLeft,
        depth: 3,
        intensity: 0.9,
        shape: NeumorphicShape.concave,
        surfaceIntensity: 0.1,
        border: NeumorphicBorder(
          color: Colors.white,
          width: 4,
        ),
      );
    }
  }
}
