
import 'package:flutter/material.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import 'package:gmoney/ui/widgets/home/rounded_card.dart';
import 'package:gmoney/util/utils.dart';



class OrdersList extends StatelessWidget {


  Widget listTile(BuildContext context){
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text("Order No: #541GE1F",style: TextStyles.appBlack18.copyWith(fontWeight: FontWeight.w500),)),
              GestureDetector(
                  onTap: ()=> Navigator.pushNamed(context, "/OrderDetails"),
                  child: Text("View delivery details",style: TextStyles.appBlack12.copyWith(fontSize: 10,decoration: TextDecoration.underline,),)),
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
          Text("Amount: ₹1000",style: TextStyles.appBlack14.copyWith(fontWeight: FontWeight.w500,fontSize: 14),)
        ],
      );

  }
  Widget addNewUI(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(12,8,12,8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Color(0xFFEBEBEB)),
            child: Text("Place New Order"),),
          Container(
            margin: EdgeInsets.only(left: 8),
            decoration:BoxDecoration(shape: BoxShape.circle,color: DefaultColor.appDarkBlue,),
            child: IconButton(
                iconSize: 39,
                onPressed: (){
                  Navigator.pushNamed(context, "/GroupBuyHome");
                }, icon: Icon(Icons.add,color: DefaultColor.appBarWhite,)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColor.scaffoldBgWhite,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
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
                ListView.builder(
                    padding: EdgeInsets.only(top: 0,bottom: 20),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return RoundedCard(childWidget: listTile(context));
                    }),
              /*})*/
            ),
          ),
          addNewUI(context)
        ],
      ),
    );
  }
}
