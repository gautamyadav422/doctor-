import 'package:flutter/material.dart';
import 'package:gmoney/models/partner_details_model.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/ui/widgets/button_outlined.dart';
import 'package:gmoney/ui/widgets/home/rounded_card.dart';
import 'package:gmoney/util/utils.dart';

import '../../../bloc/partner_details_bloc.dart';

class StatementOption extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StatementOptionState();
  }
}

class StatementOptionState extends State<StatementOption> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColor.scaffoldBgWhite,
      body: SingleChildScrollView(
        child: CommonCustomBG(
            cardTopPadding: 6.5,
            widgetsOverGradient: AppBarBackArrow(
                title: "Equipment Finance",
                onTap: () => Navigator.pop(context)),
            isCardOnTop: false,
            screenWidgets: RoundedCard(
                childWidget: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 0, right: 15, bottom: 10),
                  child: Text(
                    "Bank Statement",
                    style: TextStyle(
                        color: DefaultColor.blueDarkLogin,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: Text("Upload your bank statement to verify bank",
                      style:
                          TextStyle(color: DefaultColor.black, fontSize: 14)),
                ),
                SizedBox(
                  height: 10,
                ),
                AppButton(
                  buttonTitle: "Upload Statement",
                  onTap: () {
                    Navigator.pushNamed(context, "/StatementUpload");

                  },
                  height: 45.0,

                ),
                SizedBox(
                  height: 10,
                ),
                ButtonOutlined(
                  "Fetch Statement",
                   () {
                     Navigator.pushNamed(context, "/StatementUpload");

                   },
                  width: MediaQuery.of(context).size.width,
                  height: 40.0,
                ),
              ],
            ))
            /*})*/
            ),
      ),
    );
  }
}
