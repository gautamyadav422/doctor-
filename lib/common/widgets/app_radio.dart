import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class RadioContainer extends StatelessWidget {
  RadioContainer({Key? key, required this.isSelected, required this.onPressed})
      : super(key: key);

  bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {},
        child: Neumorphic(
          style: _getStyle(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
            ),
            child: SizedBox(
              width: 20,
              height: 20,
            ),
          ),
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
