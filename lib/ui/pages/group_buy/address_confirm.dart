
import 'package:flutter/material.dart';
import 'package:gmoney/bloc/consumer_home.dart';
import 'package:gmoney/models/consumer_home_model.dart';
import 'package:gmoney/ui/pages/group_buy/address_bottom_sheet.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/ui/widgets/home/rounded_card.dart';
import 'package:gmoney/util/utils.dart';





class AddressConfirm extends StatefulWidget {
  final data;

  AddressConfirm({this.data});

  @override
  State<AddressConfirm> createState() => _AddressConfirmState();
}

class AddressData{
  int totalQty;
  double totalAmt;
  double shippingCharges;

  AddressData(this.totalQty, this.totalAmt, this.shippingCharges);

}

class _AddressConfirmState extends State<AddressConfirm> {
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
              ))
        ],
      ),
    );
  }

  Widget filterView(BuildContext context, AddressData data){
    print('widget.data');
    print(data.totalAmt);
    return  RoundedCard(
      childWidget:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text("Order Summary",style: TextStyles.appBlack18.copyWith(fontWeight: FontWeight.w500),)),
              GestureDetector(
                  onTap : (){
                    Navigator.of(context).pop();
                  },child: Text("Modify Order",style: TextStyles.appBlack14.copyWith(fontWeight: FontWeight.w400,decoration: TextDecoration.underline,),)),
            ],
          ),
          SizedBox(height: 10,),
          Text("Total Quantity: ${data.totalQty.toInt()}",style: TextStyles.appBlack14.copyWith(fontWeight: FontWeight.w400),),
          SizedBox(height: 10,),
          Text("Order Amount: ₹${data.totalAmt.toInt()}",style: TextStyles.appBlack14.copyWith(fontWeight: FontWeight.w500,fontSize: 16),)
          ,SizedBox(height: 8,),
          Text("Shipping Charges: ₹${data.shippingCharges.toInt()}",style: TextStyles.appBlack14.copyWith(fontWeight: FontWeight.w500,fontSize: 16),)
        ],
      ),
      paddingBottom: 27.0,paddingLeft: 20.0,paddingRight: 20.0,paddingTop: 20.0,
    );
  }

  Widget bottomView(BuildContext context){
    return StreamBuilder<ConsumerHomeModel>(
        stream: consumerHome.homeData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Utils.instance.loader(context);
          }
          return RoundedCard(
            childWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Billing & Delivery Address",style: TextStyles.appBlack18.copyWith(fontWeight: FontWeight.w500),),
                SizedBox(height: 6,),
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  physics: ScrollPhysics(),
                  itemCount: snapshot.data!.data!.cards!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index, ) {
                    return _row(snapshot.data!.data!.cards![index].cardNumber!, index,snapshot.data!.data!.cards![index].type!.cardImage! );
                  },
                ),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet<dynamic>(
                          isScrollControlled: true,
                          constraints: BoxConstraints.loose(Size(
                              MediaQuery.of(context).size.width,
                              MediaQuery.of(context).size.height * 0.75)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                          ),
                          context: context,
                          builder: (_) {
                            return AddressBottomSheet();
                          });
                    },
                    child: Text("Add a new address",style: TextStyles.appBlack14.copyWith(color: DefaultColor.appDarkBlue,decoration: TextDecoration.underline,),)),
                ///
                _checkBoxUI()
              ],
            )
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
    print('widget.data');
    await consumerHome.getConsumerHomeData();
  }

  @override
  Widget build(BuildContext context) {
    var _data =    (widget.data) as AddressData;

    return Scaffold(
      backgroundColor: DefaultColor.scaffoldBgWhite,
      body: SingleChildScrollView(
        child: CommonCustomBG(
            cardTopPadding: 6.5,
            widgetsOverGradient: AppBarBackArrow(title: "Group Buy", onTap: ()=> Navigator.pushNamedAndRemoveUntil(context, "/HomeScreen", (route) => false)),
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
                filterView(context, _data),
                bottomView(context),
                SizedBox(height: 10,),
                AppButton(buttonTitle: "Make Payment",onTap: (){
                  Navigator.pushNamed(context, "/OrderConfirm");
                },),
              ],
            )
          /*})*/
        ),
      ),
    );
  }
}
