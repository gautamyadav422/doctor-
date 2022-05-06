import 'package:flutter/material.dart';
import 'package:gmoney/util/utils.dart';



class RoundedCard extends StatelessWidget {

  final childWidget;
  final paddingTop;
  final paddingBottom;
  final paddingLeft;
  final paddingRight;
  final backColor;
RoundedCard({@required this.childWidget,
      this.paddingBottom,
      this.paddingLeft,
      this.paddingRight,
      this.paddingTop,
      this.backColor});
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.fromLTRB(paddingLeft??15,paddingTop??15,paddingRight??15,paddingBottom??15),
        margin: EdgeInsets.only(bottom: 15),decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),color: backColor ?? DefaultColor.appBarWhite
    ),child: this.childWidget);
  }
}
