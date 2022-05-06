
  import 'package:flutter/material.dart';
  import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
  import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
  import 'package:gmoney/ui/widgets/app_button.dart';
  import 'package:gmoney/ui/widgets/home/rounded_card.dart';
  import 'package:gmoney/util/utils.dart';


  class OrderPlaced extends StatelessWidget {


    Widget card1(){
      return RoundedCard(
        childWidget:  Column(
          children: [
            Text("Thank You !!",style: TextStyles.appBlack18.copyWith(fontWeight: FontWeight.w500,fontSize: 16)),
            SizedBox(height: 10,),
            Text("Your order with order id #541GE1F has been placed.",
              style: TextStyles.appBlack18.copyWith(fontWeight: FontWeight.w400,fontSize: 16),textAlign: TextAlign.center,),
            SizedBox(
              height: 15,
            ),
            AppButton(buttonTitle: "Ok",onTap: (){},),
             ],
        ),
        paddingBottom: 27.0,paddingLeft: 25.0,paddingRight: 25.0,paddingTop: 20.0,
      );
    }
    Widget card2(){
      return RoundedCard(
        childWidget:  Text("You will receive your delivery within 7 - 10 working days",
          style: TextStyles.appBlack18.copyWith(fontWeight: FontWeight.w400,fontSize: 16,),textAlign: TextAlign.center,),
        paddingBottom: 27.0,paddingLeft: 25.0,paddingRight: 25.0,paddingTop: 20.0,
      );
    }
    Widget card3(){
      return RoundedCard(
        childWidget:  Text("You will receive shipping and delivery details through SMS",
          style: TextStyles.appBlack18.copyWith(fontWeight: FontWeight.w400,fontSize: 16),textAlign: TextAlign.center,),
        paddingBottom: 27.0,paddingLeft: 25.0,paddingRight: 25.0,paddingTop: 20.0,
      );
    }




    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: DefaultColor.scaffoldBgWhite,
        body: SingleChildScrollView(
          child: CommonCustomBG(
              cardTopPadding: 6.2,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  card1(),
                  card2(),
                  card3()
                ],
              )
            /*})*/
          ),
        ),
      );
    }
  }
