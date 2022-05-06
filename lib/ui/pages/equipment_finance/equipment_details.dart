import 'package:flutter/material.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/ui/widgets/home/rounded_card.dart';
import 'package:gmoney/util/utils.dart';
class EquipmentDetails extends StatelessWidget {


  Widget card1(){
    return RoundedCard(
      childWidget:
         Container(
           width: double.infinity,
           child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Skanray Technologies",
                    style: TextStyles.appBlack18,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Total Equipments: 18",
                    style: TextStyles.appBlack14
                        .copyWith(fontWeight: FontWeight.w400),
                  )
                ],
              ),
         ),
      paddingBottom: 27.0,
      paddingLeft: 20.0,
      paddingRight: 20.0,
      paddingTop: 20.0,
    );
  }
  Widget _info(){
    return Column(
      children: [

      ],
    );
  }
  Widget _text(String text){
    return Padding(
        padding: const EdgeInsets.fromLTRB(10,0,10,8),
        child:  Text(text,style: TextStyles.appBlack12.copyWith(
          fontSize: 14,),)
    );
  }
  Widget _titleText(String text){
    return Padding(
        padding: const EdgeInsets.fromLTRB(10,15,10,8),
        child:  Text(text,style: TextStyles.appBlack14,)
    );
  }
  Widget card2(){
    return RoundedCard(
      paddingTop: 8.0,paddingRight: 8.0,paddingLeft: 8.0,
      childWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: DefaultColor.scaffoldBgWhite),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10,15,10,7),
            child: Text(
              "Medispar MRI and Brain Scanner",
              style: TextStyles.appBlack14.copyWith(fontSize: 16,color: DefaultColor.blueDarkLogin),
            ),
          ),
          _text("Category: Diagnostics"),
          _text("Brand: Skyray Technologies"),
          _text("MRP: ₹1,30,000"),
          _text("New Price: ₹1,00,000"),
          _titleText("Technical Constraints:"),
          _text("Top Dimension : L 1905 x W 533 mm"),
          _text("Height Adjustment : 750 mm - 1000 mm"),
          _text("Trendelenburg / Reverse : 30º / 25º"),
          _text("Lateral Tilt : 20º / 20º"),
          _titleText("Standard Accessories:"),
          _text("Top Dimension : L 1905 x W 533 mm"),
          _text("Height Adjustment : 750 mm - 1000 mm"),
          _text("Trendelenburg / Reverse : 30º / 25º"),
          _text("Lateral Tilt : 20º / 20º"),
          _titleText("OverView:"),
          _text("The positions in five section table top are adjusted manually by mechanical drive. up-down table position can be fixed by stepping foot pedal")
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColor.scaffoldBgWhite,
      body: SingleChildScrollView(
        child: CommonCustomBG(
            cardTopPadding: 6.2,
            widgetsOverGradient: AppBarBackArrow(title: "Equipment Finance", onTap: ()=> Navigator.pop(context)),
            isCardOnTop: false,
            screenWidgets: /*StreamBuilder<MyBillsModel>(
                stream: myBillsBloc.getMyBillsData,
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Utils.instance.loader(context);
                  }
                  return snapshot.data!.data!.isEmpty ?
                  Utils.instance.notFoundContainer("No data Found..", context) :*/
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                card1(),
                card2(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,10,0),
                  child: AppButton(onTap: (){},buttonTitle: "I Am Interested. Call Me",),
                )
              ],
            )
          /*})*/
        ),
      ),
    );
  }
}
