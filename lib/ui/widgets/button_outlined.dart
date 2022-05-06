import 'package:flutter/material.dart';
import 'package:gmoney/util/utils.dart';





class ButtonOutlined extends StatelessWidget {
  final title;
  final VoidCallback onTap;
  final color;
  final height;
  final width;
  ButtonOutlined(this.title,this.onTap,{this.color,this.height,this.width});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:  this.height ?? null,
      width: this.width ?? null,
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(width: 1, color: DefaultColor.appDarkBlue),
            backgroundColor: this.color ?? Colors.white,
            primary: Theme.of(context).primaryColorDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          onPressed:onTap, child: Padding(
        padding: const EdgeInsets.only(right: 16,left: 16),
        child: Text(this.title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,
            color: this.color != null  ? Colors.white : DefaultColor.appDarkBlue),),
      )),
    );
  }
}
