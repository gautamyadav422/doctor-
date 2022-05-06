import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gmoney/bloc/bank_details_bloc.dart';
import 'package:gmoney/models/details_bank_medel.dart';
import 'package:gmoney/models/ifsc_res-model.dart';
import 'package:gmoney/ui/dashboard_components/verify_statement.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/util/utils.dart';
import 'package:screen_loader/screen_loader.dart';

class DetailBankScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailBankState();
  }
}

class DetailBankState extends State<DetailBankScreen> with ScreenLoader {


  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
  @override
  void initState() {
  getBank();
    super.initState();
  }
  getBank()async{
    startLoading();
  await  bankDetailsBloc.getBankDetails(Map());
    stopLoading();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement screen
    return Scaffold(
      backgroundColor: DefaultColor.lightGrey,
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: new BoxDecoration(
                  color: DefaultColor.lightGrey,
                  gradient: new LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      DefaultColor.blueDark,
                      DefaultColor.blueLightGradient
                    ],
                  ))),
          ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: DefaultColor.appBarWhite,
                          )),
                      Text(
                        "Bank Detail",
                        style: TextStyle(
                            color: DefaultColor.appBarWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: DefaultColor.appBarWhite,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: StreamBuilder<BankRes>(
                    stream: bankDetailsBloc.bankDetailsStream,
                    builder: (context, snapshot) {
                      if(!snapshot.hasData){
                        return Center(child: Container(),);
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 15, right: 15, bottom: 20),
                            child: Text(
                              "Bank Details",
                              style: TextStyle(
                                  color: DefaultColor.blueDarkLogin,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 15),
                            child: Text("Account Number",
                                style: TextStyle(
                                    color: DefaultColor.black, fontSize: 14)),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 10),
                                  child: Text(
                                    "${snapshot.data?.data?.accountNo??"123456789"}",
                                    style: TextStyle(
                                        fontSize: 14, color: DefaultColor.black),
                                  ),
                                ),
                              ],
                            ),
                            margin:
                                EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                color: DefaultColor.greyBackground,
                                border: Border.all(color: DefaultColor.blueMobile),
                                borderRadius: BorderRadius.all(Radius.circular(4))),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 15),
                            child: Text("IFSC Code",
                                style: TextStyle(
                                    color: DefaultColor.black, fontSize: 14)),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 10),
                                  child: Text("${snapshot.data?.data?.ifsc??"123456789"}"),
                                ),
                              ],
                            ),
                            margin:
                                EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                color: DefaultColor.greyBackground,
                                border: Border.all(color: DefaultColor.blueMobile),
                                borderRadius: BorderRadius.all(Radius.circular(4))),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 15),
                            child: Text("Upload your bank statement to proceed",
                                style: TextStyle(
                                    color: DefaultColor.greyBackButton,
                                    fontSize: 12)),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, "/BankStatementUpload");
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 10),
                                        child: Text("Upload Statement",style: TextStyle(color: DefaultColor.appBarWhite),),
                                      ),
                                    ),
                                  ],
                                ),
                                margin:
                                EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                decoration: BoxDecoration(
                                    color: DefaultColor.blueDark,
                                    border: Border.all(color: DefaultColor.blueMobile),
                                    borderRadius: BorderRadius.all(Radius.circular(4))),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => VerifyStatement()));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 10),
                                      child: Text("Verify online statement"),
                                    ),
                                  ),
                                ],
                              ),
                              margin:
                              EdgeInsets.only(bottom: 15,left: 15,right: 15),
                              decoration: BoxDecoration(
                                  color: DefaultColor.greyBackground,
                                  border: Border.all(color: DefaultColor.blueMobile),
                                  borderRadius: BorderRadius.all(Radius.circular(4))),
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
