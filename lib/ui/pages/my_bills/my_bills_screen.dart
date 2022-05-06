import 'package:flutter/material.dart';
import 'package:gmoney/models/my_bills_model.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import 'package:gmoney/util/utils.dart';

import '../../../bloc/my_bills/my_bills_bloc.dart';





class MyBillsScreen extends StatefulWidget {
  const MyBillsScreen({Key? key}) : super(key: key);

  @override
  State<MyBillsScreen> createState() => _MyBillsScreenState();
}

class _MyBillsScreenState extends State<MyBillsScreen> {


  Widget descriptionUI(BuildContext context,Data _dataParams,int _index){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(alignment: Alignment.topRight,child: Container(
          margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomLeft: Radius.circular(15)),color: getColorStatus(_dataParams),),
          padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
        child: Text(/*_dataParams.offer!.check!.status*/"${getStatus(_dataParams)}",style: TextStyle(color: DefaultColor.appBarWhite),),
        ),),
          Text(_dataParams.merchant!.name ?? "Wockhardt Hospital",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
          SizedBox(height: 25,),
          Row(
            children: [
            Expanded(child: Text("Category:",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)),
              Expanded(child: Text("Amount:",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),))
          ],),
        SizedBox(height: 5,),
        Row(
          children: [
            Expanded(child: Text(_dataParams.category!.name??"Health checkup",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),)),
            Expanded(child: Text(_dataParams.offer!.loanAmount.toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),))
          ],),
        SizedBox(height: 25,),
        Text("Date:"),
        SizedBox(height: 5,),
        Text("${_dataParams.offer!.admissionDate!=null?Utils.instance.dateFormation(_dataParams.offer!.admissionDate!):"Not Found"}"),
        SizedBox(height: 25,),
        GestureDetector(
          onTap: () async {
          await Navigator.pushNamed(context, "/MyBillsDetails",arguments: _index).then((value) =>{
            myBillsBloc.getBillsDataApi()
          });},
          child: Align(alignment: Alignment.center,child: Text("View details",  style: TextStyle(
            decoration: TextDecoration.underline,
            color: DefaultColor.blueDark,
            fontSize: 17,fontWeight: FontWeight.w500
          ),),),
        )
      ],
    );
  }
  String? getStatus(Data _dataParams){
    String? status;
    print("transaction >>>> ${_dataParams.transaction}");
    if (_dataParams.transaction != null && _dataParams.transaction?.length != 0) {
      for (int i = 0; i < _dataParams.transaction!.length; i++) {
        if (_dataParams.transaction?[i].loan
            ?.status ==
            "Pending") {
          status = _dataParams.offer?.check?.status;
        } else {
         status = _dataParams
              .transaction?[i].loan?.status;
        }
      }
    } else {
      status =
          _dataParams.offer?.check?.status;
    }
    switch(status){
      case "Presented" :
        status = "New";
        break;
      case "Customer Accepted" :
        status = "Approval Awaited";
        break;
      case "Limit Exhausted" :
        status = "Limit Exhausted";
        break;
      case "Customer Cancel" :
        status = "Declined";
        break;
      case "Approved" :
        status = "Approved";
        break;
      case "Approved-AC" :
        status = "Disbursed";
        break;
      case "Part-Disbursal" :
        status = "Disbursed";
        break;
      case "Rejected" :
        status = "Rejected";
        break;
      default :
        status = "status data";
        break;
    }
    return  status;
  }

  Color? getColorStatus(Data _dataParams){
    String? status;
    print("transaction >>>> ${_dataParams.transaction}");
    if (_dataParams.transaction != null && _dataParams.transaction?.length != 0) {
      for (int i = 0; i < _dataParams.transaction!.length; i++) {
        if (_dataParams.transaction?[i].loan
            ?.status ==
            "Pending") {
          status = _dataParams.offer?.check?.status;
        } else {
          status = _dataParams
              .transaction?[i].loan?.status;
        }
      }
    } else {
      status =
          _dataParams.offer?.check?.status;
    }
    var color;
    switch(status){
      case "Presented" :
        color = DefaultColor.blueDark;
        break;
      case "Customer Accepted" :
        color = Utils.getColorFromHex("F9B50F");
        break;
      case "Limit Exhausted" :
        color = Utils.getColorFromHex("FF0000");
        break;
      case "Customer Cancel" :
        color = Utils.getColorFromHex("FF0000");
        break;
      case "Approved" :
        color = Utils.getColorFromHex("15A552");
        break;
      case "Approved-AC" :
        color = Utils.getColorFromHex("15A552");
        break;
      case "Part-Disbursal" :
        color = Utils.getColorFromHex("15A552");
        break;
      case "Rejected" :
        color = Utils.getColorFromHex("FF0000");
        break;
      default :
        color = DefaultColor.appDarkBlue;
        break;
    }
    return  color;
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    myBillsBloc.getBillsDataApi();

}
  @override
  Widget build(BuildContext context) {
    print("checking >>>>>>>>>");
    return Scaffold(
      backgroundColor: DefaultColor.scaffoldBgWhite,
      body: SingleChildScrollView(
        child: CommonCustomBG(
          cardTopPadding: 8.5,
          widgetsOverGradient: AppBarBackArrow(title: "My Bills", onTap: ()=> Navigator.pop(context)),
          isCardOnTop: false,
          screenWidgets: StreamBuilder<MyBillsModel>(
            stream: myBillsBloc.getMyBillsData,
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                  return Utils.instance.loader(context);
              }
              return snapshot.data!.data!.isEmpty ? Utils.instance.notFoundContainer("No data Found..", context) : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                return Container(
                    padding: EdgeInsets.fromLTRB(20,0,0,20),
                    margin: EdgeInsets.only(bottom: 15),decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),color: Utils.getColorFromHex("#FFFFFF")
                ),child: descriptionUI(context,snapshot.data!.data![index],index));
              });
            }
          )
        ),
      ),
    );
  }
}
