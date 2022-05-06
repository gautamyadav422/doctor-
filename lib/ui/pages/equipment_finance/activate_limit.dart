import 'package:flutter/material.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/ui/widgets/home/rounded_card.dart';
import 'package:gmoney/util/utils.dart';



class ActivateLimit extends StatelessWidget {
  var textProductController;
  var textBrandController;
  var textMoneyController;


  // final List<String>  timeLineText = ["Order Placed","Order Confirmed","Shipped","Delivered"];
  // final List<String>  timeLineSubText = ["Your order is successfully placed","Your order is confirmed from our side","Your order is on its way (Track Shipping)","Order delivered"];
  // Widget listTile(BuildContext context){
  //   return  Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Row(
  //         children: [
  //           Expanded(child: Text("Order No: #541GE1F",style: TextStyles.appBlack18.copyWith(fontWeight: FontWeight.w500),)),
  //           Text("View order summary",style: TextStyles.appBlack12.copyWith(fontSize: 10,decoration: TextDecoration.underline,),),
  //         ],
  //       ),
  //       SizedBox(height: 7,),
  //       Text("18-Feb-2022, 11:54 AM",style: TextStyles.appBlack12.copyWith(fontSize: 10),),
  //       SizedBox(height: 10,),
  //       Row(
  //         children: [
  //           Text("Total Items: 04",style: TextStyles.appBlack12,),
  //           SizedBox(width: MediaQuery.of(context).size.width/7,),
  //           Text("Total Quantity: 1200",style: TextStyles.appBlack12,),
  //         ],
  //       ),
  //       SizedBox(height: 10,),
  //       Text("Amount: ₹1000",style:
  //       TextStyles.appBlack14.copyWith(fontWeight: FontWeight.w500,fontSize: 14),),
  //       Padding(
  //         padding: const EdgeInsets.fromLTRB(0,10,0,12),
  //         child: Divider(color: DefaultColor.blackSubText,),
  //       ),
  //       ListView.builder(
  //           padding: EdgeInsets.all(0),
  //           shrinkWrap: true,
  //           physics: NeverScrollableScrollPhysics(),
  //           itemCount: 4,
  //           itemBuilder: (context, index){
  //             return _timeLineTile(index);
  //           })
  //     ],
  //   );
  // }
  // Widget _timeLineTile(int index){
  //   return TimelineTile(
  //       axis: TimelineAxis.vertical,
  //       afterLineStyle:
  //       LineStyle(color: DefaultColor.green,thickness: 2),
  //       beforeLineStyle: LineStyle(
  //           color: index == 3 ? Colors.grey : DefaultColor.green,thickness: 2),
  //       isFirst:  index == 0 ?true : false,
  //       isLast:  index == 3 ? true :false,
  //       hasIndicator: true,
  //       endChild: Padding(
  //         padding: const EdgeInsets.only(left: 20,top: 5,bottom: 20),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(timeLineText[index],style: TextStyle(
  //                 color: DefaultColor.blueDarkLogin,
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.bold),),
  //             Padding(
  //               padding: const EdgeInsets.symmetric(vertical: 5),
  //               child: Text(timeLineSubText[index],style: TextStyle(
  //                   color: DefaultColor.blueDarkLogin,
  //                   fontSize: 12,
  //                   fontWeight: FontWeight.normal),),
  //             ),
  //           ],
  //         ),
  //       ),
  //       alignment: TimelineAlign.start,
  //       indicatorStyle: IndicatorStyle(
  //           color: index == 3 ? DefaultColor.blackSubText : Colors.green,
  //           drawGap: true,
  //           indicatorXY: 0.2,
  //           height: 10,
  //           width: 10
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColor.scaffoldBgWhite,
      body:
      SingleChildScrollView(
        child: CommonCustomBG(
            cardTopPadding: 6.5,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RoundedCard(childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment : CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 0, right: 15, bottom: 10),
                    child: Text(
                      "Activate Limit",
                      style: TextStyle(
                          color: DefaultColor.blueDarkLogin,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 0),
                    child: Text("Upload your bank statement to activate limit",
                        style: TextStyle(
                            color: DefaultColor.black, fontSize: 14)),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Center(
                        child: TextField(
                            controller: textProductController,
                            keyboardType: TextInputType.text,
                            onChanged: (text) {},
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              isDense: true,
                              hintText: "Enter Product Name",
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    decoration: BoxDecoration(
                        border: Border.all(color: DefaultColor.grey),
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Center(
                        child: TextField(
                            controller: textBrandController,
                            keyboardType: TextInputType.text,
                            onChanged: (text) {},
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              isDense: true,
                              hintText: "Enter Brand Name",
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    decoration: BoxDecoration(
                        border: Border.all(color: DefaultColor.grey),
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 12,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Center(
                        child: TextField(
                            controller: textMoneyController,
                            keyboardType: TextInputType.text,
                            onChanged: (text) {},
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              isDense: true,
                              hintText: "Enter Finance Required",
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    decoration: BoxDecoration(
                        border: Border.all(color: DefaultColor.grey),
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                    SizedBox(height: 10,),
                    AppButton(buttonTitle: "Next",onTap: (){
                      Navigator.pushNamed(context, "/PartnerDetails");
                    },),
                ],)),

              ],
            )
          /*})*/
        ),
      ),

    );
  }
}
