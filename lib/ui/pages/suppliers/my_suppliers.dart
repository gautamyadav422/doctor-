import 'package:flutter/material.dart';

import '../../../util/utils.dart';
import '../../widgets/CommonCustomBg.dart';
import '../../widgets/appBar_backArrow.dart';

class MySuppliers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MySuppliersState();
  }
}

class MySuppliersState extends State<MySuppliers> {
  List<String> _list = ["NA", "ACC", "REJ", "ACC", "REJ"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: DefaultColor.scaffoldBgWhite,
      body: SingleChildScrollView(
        child: CommonCustomBG(
            cardTopPadding: 8.5,
            widgetsOverGradient: AppBarBackArrow(
                title: "My Suppliers", onTap: () => Navigator.pop(context)),
            isCardOnTop: false,
            screenWidgets: ListView.builder(
                itemCount: _list.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _list[index] == "NA"
                      ? GestureDetector(
                    onTap: ()=>Navigator.pushNamed(context, "/BillPayments"),
                        child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: DefaultColor.appBarWhite,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Dentcare 123",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: DefaultColor.blackSubText),
                                        ),
                                        Text(
                                          "Dentcare123 has invited you to accept dentacre123 as supplier",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: DefaultColor.greyBackButton),
                                        ),
                                        Text(
                                          "Since: 15 Mar 2022",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: DefaultColor.greyBackButton),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(6),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: DefaultColor.blueDark,
                                              border: Border.all(
                                                  color: DefaultColor.blueDark)),
                                          child: Icon(
                                            Icons.done,
                                            color: DefaultColor.appBarWhite,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: DefaultColor.blueDark)),
                                          child: Icon(Icons.close),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      )
                      : _list[index] == "ACC"
                          ? Container(
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Dentcare 123",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color:
                                                    DefaultColor.blackSubText),
                                          ),
                                          Text(
                                            "Accepted",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: DefaultColor.greenText),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Since: 15 Mar 2022",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: DefaultColor.greyBackButton),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Bills presented: 200",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: DefaultColor
                                                    .greyBackButton),
                                          ),
                                          Text(
                                            "Bills accepted: 150",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: DefaultColor
                                                    .greyBackButton),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Bills declined: 50",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: DefaultColor.greyBackButton),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Dentcare 123",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color:
                                                    DefaultColor.blackSubText),
                                          ),
                                          Text(
                                            "Rejected",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: DefaultColor.redText),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "Since: 15 Mar 2022",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: DefaultColor.greyBackButton),
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
