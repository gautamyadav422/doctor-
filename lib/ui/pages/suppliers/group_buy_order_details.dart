import 'package:flutter/material.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/util/utils.dart';
import 'package:timeline_tile/timeline_tile.dart';

class GBOrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
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
                    "Group Buy Order Details",
                    style: TextStyle(
                        color: DefaultColor.appBarWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      color: DefaultColor.appBarWhite,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Order No: #GV678I",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: DefaultColor.blackSubText),
                                    ),
                                    Text(
                                      "Invoice Date:",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: DefaultColor.blackSubText),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Order No: #GV678I",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: DefaultColor.greyBackButton),
                                    ),
                                    Text(
                                      "09 Feb 22",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: DefaultColor.blackSubText),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,),
                                child: Text(
                                  "Branch: Mumbai, Maharashtra",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: DefaultColor.greyBackButton),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5),
                                            child: Text(
                                              "EMI Duration: 03 months",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  overflow: TextOverflow.ellipsis,
                                                  color: DefaultColor.greyBackButton),
                                            ),
                                          ),
                                          Text(
                                            "Delivery date: 20 Mar 2022",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: DefaultColor.greyBackButton),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5),
                                            child: Text(
                                              "Invoice Total:",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: DefaultColor.greyBackButton),
                                            ),
                                          ),
                                          Text(
                                            "₹50,000",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: DefaultColor.blackSubText),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: ()=>Navigator.of(context).pop(),
                                      child: Text(
                                        "View less details",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,

                                            decoration: TextDecoration.underline,
                                            color: DefaultColor.blueDark),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                                  child: TimelineTile(
                                      axis: TimelineAxis.vertical,
                                      afterLineStyle:
                                      LineStyle(color: DefaultColor.green,thickness: 2),
                                      beforeLineStyle: LineStyle(
                                          color: DefaultColor.green,thickness: 2),
                                      isFirst: index == 0 ? true : false,
                                      isLast: index == 3 ? true : false,
                                      hasIndicator: true,
                                      endChild: Padding(
                                        padding: const EdgeInsets.only(left: 20,top: 5,bottom: 5),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Paid",style: TextStyle(
                                                color: DefaultColor.blueDarkLogin,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 5),
                                              child: Text("Amount: Rs. 30,000",style: TextStyle(
                                                  color: DefaultColor.blueDarkLogin,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 5),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Due date: 15th Oct’21",style: TextStyle(
                                                      color: DefaultColor.blueDarkLogin,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.normal),),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 10),
                                                    child: Text("Paid on: 15th Oct’21",style: TextStyle(
                                                        color: DefaultColor.blueDarkLogin,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.normal),),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      alignment: TimelineAlign.start,
                                      indicatorStyle: IndicatorStyle(
                                          drawGap: true,
                                          indicatorXY: 0.2,
                                          height: 10,
                                          width: 10
                                      )),
                                );
                              },
                              itemCount: 4,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),padding: EdgeInsets.zero,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppButton(onTap: (){
                    Navigator.of(context).pushNamed("/SupplierPaymentsDetails");
                  },buttonTitle: "Repeat Order",),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
