import 'package:flutter/material.dart';
import 'package:gmoney/util/utils.dart';




class BottomSheetBills extends StatelessWidget {
  const BottomSheetBills({Key? key}) : super(key: key);

  Widget textAndPic(String text,String icon,String subText){
    return Padding(
      padding: const EdgeInsets.fromLTRB(12,3,12,8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Align(alignment: Alignment.topRight,child: Container(
                padding: EdgeInsets.all(7),
                decoration:
                BoxDecoration(shape: BoxShape.circle,color: DefaultColor.appDarkBlue),child: Text("0",style: TextStyle(color: Colors.white),)),),
            Image.asset(icon),
            SizedBox(height: 15,),
            Text(text,textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: DefaultColor.blackSubText),)
           ,SizedBox(height: 15,),
          Text(subText,textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color: DefaultColor.blackSubText),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (){Navigator.pushNamed(context, "/MyBillsScreen").then((value) =>Navigator.pop(context));},
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),color: DefaultColor.appBarWhite,),
                  margin: EdgeInsets.fromLTRB(15,0,5,80),
                  //height: MediaQuery.of(context).size.height/4,
                  child: textAndPic("Initiate", "assets/images/noun-mobile-card.png","Send Bills To Patients"),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){Navigator.pushNamed(context, "/MyBillsScreen").then((value) =>Navigator.pop(context));},
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),color: DefaultColor.appBarWhite,),
                  margin: EdgeInsets.fromLTRB(7,0 ,7,80),
                  //height: 190,
                  child: textAndPic("Capture", "assets/images/processing_fee.png","Payments By Patients"),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){Navigator.pushNamed(context, "/ProcessingFeeScreen").then((value) =>Navigator.pop(context));},
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),color: DefaultColor.appBarWhite,),
                  margin: EdgeInsets.fromLTRB(5,0,15,80),
                  //height: 190,
                  child: textAndPic("Bill Payments", "assets/images/bills.png","Pay Bills Raised By Supplier"),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
