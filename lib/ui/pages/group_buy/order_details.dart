import 'package:flutter/material.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/ui/widgets/home/rounded_card.dart';
import 'package:gmoney/util/utils.dart';
import 'package:timeline_tile/timeline_tile.dart';



class OrderDetails extends StatelessWidget {

final List<String>  timeLineText = ["Order Placed","Order Confirmed","Shipped","Delivered"];
final List<String>  timeLineSubText = ["Your order is successfully placed","Your order is confirmed from our side","Your order is on its way (Track Shipping)","Order delivered"];
  Widget listTile(BuildContext context){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text("Order No: #541GE1F",style: TextStyles.appBlack18.copyWith(fontWeight: FontWeight.w500),)),
            Text("View order summary",style: TextStyles.appBlack12.copyWith(fontSize: 10,decoration: TextDecoration.underline,),),
          ],
        ),
        SizedBox(height: 7,),
        Text("18-Feb-2022, 11:54 AM",style: TextStyles.appBlack12.copyWith(fontSize: 10),),
        SizedBox(height: 10,),
        Row(
          children: [
            Text("Total Items: 04",style: TextStyles.appBlack12,),
            SizedBox(width: MediaQuery.of(context).size.width/7,),
            Text("Total Quantity: 1200",style: TextStyles.appBlack12,),
          ],
        ),
        SizedBox(height: 10,),
        Text("Amount: ₹1000",style:
        TextStyles.appBlack14.copyWith(fontWeight: FontWeight.w500,fontSize: 14),),
        Padding(
          padding: const EdgeInsets.fromLTRB(0,10,0,12),
          child: Divider(color: DefaultColor.blackSubText,),
        ),
        ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index){
          return _timeLineTile(index);
                 })
      ],
    );
  }
  Widget _timeLineTile(int index){
    return TimelineTile(
        axis: TimelineAxis.vertical,
        afterLineStyle:
        LineStyle(color: DefaultColor.green,thickness: 2),
        beforeLineStyle: LineStyle(
            color: index == 3 ? Colors.grey : DefaultColor.green,thickness: 2),
        isFirst:  index == 0 ?true : false,
        isLast:  index == 3 ? true :false,
        hasIndicator: true,
        endChild: Padding(
          padding: const EdgeInsets.only(left: 20,top: 5,bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(timeLineText[index],style: TextStyle(
                  color: DefaultColor.blueDarkLogin,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(timeLineSubText[index],style: TextStyle(
                    color: DefaultColor.blueDarkLogin,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),),
              ),
            ],
          ),
        ),
        alignment: TimelineAlign.start,
        indicatorStyle: IndicatorStyle(
            color: index == 3 ? DefaultColor.blackSubText : Colors.green,
            drawGap: true,
            indicatorXY: 0.2,
            height: 10,
            width: 10
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColor.scaffoldBgWhite,
      body:
          SingleChildScrollView(
            child: CommonCustomBG(
              cardTopPadding: 6.5,
              widgetsOverGradient: AppBarBackArrow(title: "Group Buy", onTap: ()=> Navigator.pop(context)),
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
                 children: [
                   RoundedCard(childWidget: listTile(context)),
                   SizedBox(height: 10,),
                   AppButton(buttonTitle: "Repeat Order",onTap: (){},),
                 ],
               )
              /*})*/
            ),
          ),

    );
  }
}
