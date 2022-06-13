import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AppContainer extends StatelessWidget {
  AppContainer({
    Key? key,
    this.width,
    this.height,
    this.borderRadius = 8,
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
  final Widget? child;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      child: Container(
        constraints: constraints,
        child: child,
      ),
    );
  }
}
