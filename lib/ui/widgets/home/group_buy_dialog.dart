import 'package:flutter/material.dart';
import 'package:gmoney/util/utils.dart';




class GroupBuyDialog extends StatelessWidget {
  const GroupBuyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      insetPadding: EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("How to do Group Buy?",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
            SizedBox(height: 20,),
            Text("\u2022 You need to buy an order of minimum 1,00,000 to avail your group buy benefits.",
            style: TextStyles.appBlack12.copyWith(fontSize: 16),),
            SizedBox(height: 20,),
            Text("\u2022 This list is specially curated for your easy one - click purchase. Save more through Group Buy.",
              style: TextStyles.appBlack12.copyWith(fontSize: 16),)
          ],
        ),
      ),
    );
  }
}
