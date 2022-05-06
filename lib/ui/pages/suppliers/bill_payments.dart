import 'package:flutter/material.dart';

import '../../../util/utils.dart';
import '../../widgets/CommonCustomBg.dart';
import '../../widgets/appBar_backArrow.dart';

class BillPayments extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BillPaymentsState();
  }
}

class BillPaymentsState extends State<BillPayments> {
  List<String> _list = ["NA", "ACC", "REJ", "ACC", "REJ", "REJ", "REJ", "REJ", "REJ", "REJ", "REJ"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: DefaultColor.scaffoldBgWhite,
      body: SingleChildScrollView(
        child: CommonCustomBG(
            cardTopPadding: 8.5,
            widgetsOverGradient: AppBarBackArrow(
                title: "Bill Payments", onTap: () => Navigator.pop(context)),
            isCardOnTop: false,
            screenWidgets: ListView.builder(
                itemCount: _list.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: DefaultColor.appBarWhite,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Dentcare Supplier",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: DefaultColor.blackSubText),
                                ),
                                Text(
                                  "Invoice No:",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: DefaultColor.blackSubText),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Date: 15 Mar 2022",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: DefaultColor.greyBackButton),
                                ),
                                Text(
                                  "#INV8792",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: DefaultColor.blackSubText),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "Product: Hearing Machine",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: DefaultColor.greyBackButton),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Description: 0 jsknsnv svskvk ldvksnvksnvksnvskksnvklnvknvs",
                                    style: TextStyle(
                                        fontSize: 12,
                                        overflow: TextOverflow.ellipsis,
                                        color: DefaultColor.greyBackButton),
                                  ),
                                ),
                                Text(
                                  "Invoice Total:",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: DefaultColor.greyBackButton),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: ()=>Navigator.pushNamed(context, "/BillPaymentsDetails"),
                                  child: Text(
                                    "View Details",
                                    style: TextStyle(
                                        fontSize: 12,
                                        decoration: TextDecoration.underline,
                                        color: DefaultColor.blueDark),
                                  ),
                                ),
                                Text(
                                  "₹1,00,000",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: DefaultColor.blackSubText),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: DefaultColor.blueDark)),
                                    child: Text(
                                      "Decline",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: DefaultColor.blueDark),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: DefaultColor.blueDark,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: DefaultColor.blueDark)),
                                    child: Text(
                                      "Accept",
                                      style: TextStyle(
                                          fontSize: 12,

                                          color: DefaultColor.appBarWhite),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
