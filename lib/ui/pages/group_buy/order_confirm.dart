
import 'package:flutter/material.dart';
import 'package:gmoney/bloc/consumer_home.dart';
import 'package:gmoney/models/consumer_home_model.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/ui/widgets/home/rounded_card.dart';
import 'package:gmoney/util/utils.dart';



class OrderConfirm extends StatefulWidget {

  @override
  State<OrderConfirm> createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  int? _groupValue = -1;

  Widget _row(String _cardNumber, int _index, String _cardImg) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          SizedBox(
              height: 20,
              width: 20,
              child: Radio(
                  value: _index,
                  groupValue: _groupValue,
                  onChanged: (int? val) {
                    setState(() {
                      _groupValue = val;
                    });
                  })),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Text(
                _cardNumber,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 1.5),
              )),
          Container(
            child: Image.network(_cardImg),
            height: 36,
            width: 56,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: DefaultColor.grey),
          )
        ],
      ),
    );
  }

  Widget filterView(){
    return StreamBuilder<ConsumerHomeModel>(
        stream: consumerHome.homeData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Utils.instance.loader(context);
          }
          return  RoundedCard(
            childWidget:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Payment Method",style: TextStyles.appBlack18.copyWith(fontWeight: FontWeight.w500)),
                SizedBox(height: 10,),
                Text("Your active GMoney card",style: TextStyles.appBlack14.copyWith(fontWeight: FontWeight.w400),),
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  physics: ScrollPhysics(),
                  itemCount: snapshot.data!.data!.cards!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index, ) {
                    return _row(snapshot.data!.data!.cards![index].cardNumber!, index,snapshot.data!.data!.cards![index].type!.cardImage! );
                  },
                ),
                Text("Add a new GMoney card",style: TextStyles.appBlack14.copyWith(color: DefaultColor.appDarkBlue,decoration: TextDecoration.underline,),),
                SizedBox(height: 10,),
                Text("*Your payment is in No cost EMI",style: TextStyles.appBlack12,)
              ],
            ),
            paddingBottom: 27.0,paddingLeft: 20.0,paddingRight: 20.0,paddingTop: 20.0,
          );
        }
    );
  }

  Widget _checkBoxUI() {
    bool? isChecked = false;
    return  StatefulBuilder(builder: (thisLowerContext, innerSetState){
      return CheckboxListTile(
          contentPadding: EdgeInsets.all(0),
          activeColor: DefaultColor.blueDark,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            "Delivery address not same as billing address",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Utils.getColorFromHex("#464646")),
          ),
          value: isChecked,
          onChanged: (bool? val) {
            innerSetState(()=> isChecked = val);
          });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hitApis();
  }


  hitApis()async{
    await consumerHome.getConsumerHomeData();
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
                filterView(),
                SizedBox(height: 10,),
                AppButton(buttonTitle: "Confirm Order",onTap: (){},),
              ],
            )
          /*})*/
        ),
      ),
    );
  }
}
