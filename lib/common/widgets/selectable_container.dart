import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SelectableContainer extends StatelessWidget {
  SelectableContainer({
    Key? key,
    this.width,
    this.height,
    this.borderRadius = 8,
    this.alignment = Alignment.topLeft,
    this.isSelected = false,
    required this.onPressed,
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
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Neumorphic(
          style: _getStyle(),
          child: Container(
            constraints: constraints,
            alignment: alignment,
            child: child,
          ),
        ),
      ),
    );
  }

  NeumorphicStyle _getStyle() {
    if (isSelected) {
      return const NeumorphicStyle(
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
    } else {
      return const NeumorphicStyle(
        lightSource: LightSource.topLeft,
        depth: 5,
        intensity: 0.9,
      );
    }
  }
}
