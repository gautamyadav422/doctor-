import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gmoney/models/processing_fee_model.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import 'package:gmoney/util/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../bloc/my_bills/my_bills_bloc.dart';

class MyBillsProcessing extends StatefulWidget {
  const MyBillsProcessing({Key? key}) : super(key: key);

  @override
  State<MyBillsProcessing> createState() => _MyBillsProcessingState();
}

class _MyBillsProcessingState extends State<MyBillsProcessing> {
  DateFormat dateFormat = DateFormat('dd-MMMM-yyyy');


  /// calling upi intents
  Future<void> makeUpiPayment(String _orderId, String token, String email,
      String name, String phone) async {
    //Replace with actual values
    String appId = "1203271f226511411bd3fb1dd9723021";
    String orderId = _orderId; // to be changed
    String tokenData = token;
    // String tokenData = "bR9JCN4MzUIJiOicGbhJCLiQ1VKJiOiAXe0Jye.3YQfiYDMhJ2N2YWMxMzMyYjI6ICdsF2cfJCLyADN0ETN3QjNxojIwhXZiwiIS5USiojI5NmblJnc1NkclRmcvJCLxojI05Wdv1WQyVGZy9mIsICOxADMiojIklkclRmcvJye.SrxkZhO1XqdSkGxRCmu0-DwuEeyWoqeOUXwpD1sb7lrxqMR6-FAOe_32i5uMJ0m_TS";
    String orderAmount = "1";
    /*    String orderId = "0018"; // to be changed
    String orderAmount = "1"; */ // from api
    String orderNote = "Test Order";
    String customerName = name;
    String customerPhone = phone;
    String stage = "PROD";
    String orderCurrency = "INR";
    String customerEmail = email;
    String notifyUrl = "https://automation.quickwork.co/staticwebhook/api/http_app/notify/5f6f206a518d9024f63c2c82/callbackfromcashfreeupipayment";


    Map<String, dynamic> inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "tokenData": tokenData,
      "notifyUrl": notifyUrl
    };

    try{
      CashfreePGSDK.doUPIPayment(inputParams)
          .then((value) =>
          value?.forEach((key, value) {
            print("$key : $value");
            print("data success");
            myBillsBloc.getBillsProcessingDataApi();
          }))
          .onError((error, stackTrace) {
        print('data onError');
        print(error);
        print(stackTrace);
        Utils.instance.showToast(
            "Error occurred. Please try again ${error}", isBottom: false);
      }).catchError((onError) {
        print('data catchError');
        print(onError);
        Utils.instance.showToast(
            "Error occurred. Please try again ${onError}", isBottom: false);
      });
    }catch(e){
      Utils.instance.showToast(
          "Cashfree exception occurred ${e}", isBottom: false);
    }

  }

  Widget descriptionUI(BuildContext context, ProcessDatum _dataParams,
      int _index) {
    print('_dataParams');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              color: DefaultColor.green,
            ),
            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: Text(
              /*_dataParams.offer!.check!.status*/
              "Approved",
            ),
          ),
        ),
        Text(
          _dataParams.merchant!.name ?? "Wockhardt Hospital",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Expanded(
                child: Text(
                  "Category:",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                )),
            Expanded(
                child: Text(
                  "Amount:",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ))
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
                child: Text(
                  _dataParams.category!.name ?? "Health checkup",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                )),
            Expanded(
                child: Text(
                  _dataParams.offer!.loanAmount.toString(),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ))
          ],
        ),
        SizedBox(
          height: 25,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date:"),
                SizedBox(
                  height: 5,
                ),
                Text(
                    "${_dataParams.updatedOn != null ? dateFormat.format(
                        _dataParams.updatedOn!) : "Not Found"}"),
              ],
            ),
            SizedBox(
              width: 25,
            ),

            GestureDetector(
              onTap: () {
                myBillsBloc.getProcessingIdDetails({}, _dataParams.id!).then((
                    value) async =>
                {
                  if(value.status){
                    await myBillsBloc.getMyBillsProcessingIdData.listen((
                        event) async {
                      print('calling upi');
                      print(event.data!.orderId);
                      print(event.data!.token);
                      var prefs = await SharedPreferences.getInstance();
                      var mobile = prefs.containsKey('userMobile')
                          ? await prefs.getString('userMobile') ?? "000"
                          : "000";
                      var name = prefs.containsKey('name')
                          ? await prefs.getString('name') ?? "Any Any"
                          : "Any Any";
                      makeUpiPayment(event.data!.orderId!, event.data!.token!,
                      event.data!.customerEmail ??"admin@gmail.com", name.toString(), mobile.toString());
                    })
                  }
                  else{
                    print('calling upi else')
                  }
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: DefaultColor.appDarkBlue,

                    borderRadius: BorderRadius.circular(10)),
                height: 55,
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 3,
                child: Text(
                  "PayPF",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),

        // GestureDetector(
        //   onTap: () async {
        //     await Navigator.pushNamed(context, "/MyBillsDetails",arguments: _index).then((value) =>{
        //       myBillsBloc.getBillsDataApi()
        //     });},
        //   child: Align(alignment: Alignment.center,child: Text("View details",  style: TextStyle(
        //       decoration: TextDecoration.underline,
        //       color: DefaultColor.blueDark,
        //       fontSize: 17,fontWeight: FontWeight.w500
        //   ),),),
        // )
      ],
    );
  }

  // String? getStatus(ProcessDatum _dataParams){
  //   String? status;
  //   print("transaction >>>> ${_dataParams.transaction}");
  //   if (_dataParams.transaction != null && _dataParams.transaction?.length != 0) {
  //     for (int i = 0; i < _dataParams.transaction!.length; i++) {
  //       if (_dataParams.transaction?[i].loan
  //           ?.status ==
  //           "Pending") {
  //         status = _dataParams.offer?.check?.status;
  //       } else {
  //         status = _dataParams
  //             .transaction?[i].loan?.status;
  //       }
  //     }
  //   } else {
  //     status =
  //         _dataParams.offer?.check?.status;
  //   }
  //   switch(status){
  //     case "Presented" :
  //       status = "New";
  //       break;
  //     case "Customer Accepted" :
  //       status = "Approval Awaited";
  //       break;
  //     case "Limit Exhausted" :
  //       status = "Limit Exhausted";
  //       break;
  //     case "Customer Cancel" :
  //       status = "Declined";
  //       break;
  //     case "Approved" :
  //       status = "Approved";
  //       break;
  //     case "Approved-AC" :
  //       status = "Disbursed";
  //       break;
  //     case "Part-Disbursal" :
  //       status = "Disbursed";
  //       break;
  //     case "Rejected" :
  //       status = "Rejected";
  //       break;
  //     default :
  //       status = "status data";
  //       break;
  //   }
  //   return  status;
  // }
  //
  // Color? getColorStatus(ProcessDatum _dataParams){
  //   String? status;
  //   print("transaction >>>> ${_dataParams.transaction}");
  //   if (_dataParams.transaction != null && _dataParams.transaction?.length != 0) {
  //     for (int i = 0; i < _dataParams.transaction!.length; i++) {
  //       if (_dataParams.transaction?[i].loan
  //           ?.status ==
  //           "Pending") {
  //         status = _dataParams.offer?.check?.status;
  //       } else {
  //         status = _dataParams
  //             .transaction?[i].loan?.status;
  //       }
  //     }
  //   } else {
  //     status =
  //         _dataParams.offer?.check?.status;
  //   }
  //   var color;
  //   switch(status){
  //     case "Presented" :
  //       color = DefaultColor.blueDark;
  //       break;
  //     case "Customer Accepted" :
  //       color = Utils.getColorFromHex("F9B50F");
  //       break;
  //     case "Limit Exhausted" :
  //       color = Utils.getColorFromHex("FF0000");
  //       break;
  //     case "Customer Cancel" :
  //       color = Utils.getColorFromHex("FF0000");
  //       break;
  //     case "Approved" :
  //       color = Utils.getColorFromHex("15A552");
  //       break;
  //     case "Approved-AC" :
  //       color = Utils.getColorFromHex("15A552");
  //       break;
  //     case "Part-Disbursal" :
  //       color = Utils.getColorFromHex("15A552");
  //       break;
  //     case "Rejected" :
  //       color = Utils.getColorFromHex("FF0000");
  //       break;
  //     default :
  //       color = DefaultColor.appDarkBlue;
  //       break;
  //   }
  //   return  color;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myBillsBloc.getBillsProcessingDataApi();
  }

  @override
  Widget build(BuildContext context) {
    print("checking >>>>>>>>>");
    return Scaffold(
      backgroundColor: DefaultColor.scaffoldBgWhite,
      body: SingleChildScrollView(
        child: CommonCustomBG(
            cardTopPadding: 8.5,
            widgetsOverGradient: AppBarBackArrow(
                title: "My Bills", onTap: () => Navigator.pop(context)),
            isCardOnTop: false,
            screenWidgets: StreamBuilder<ProcessingFeeRes>(
                stream: myBillsBloc.getMyBillsProcessingData,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Utils.instance.loader(context);
                  }
                  return snapshot.data!.data!.isEmpty
                      ? Utils.instance
                      .notFoundContainer("No data Found..", context)
                      : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                            margin: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Utils.getColorFromHex("#FFFFFF")),
                            child: descriptionUI(context,
                                snapshot.data!.data![index], index));
                      });
                })),
      ),
    );
  }
}
