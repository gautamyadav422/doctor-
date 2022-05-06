import 'package:flutter/material.dart';
import 'package:gmoney/models/partner_details_model.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/ui/widgets/home/rounded_card.dart';
import 'package:gmoney/util/utils.dart';

import '../../../bloc/partner_details_bloc.dart';

class PartnerDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PartnerDetailsState();
  }
}

class PartnerDetailsState extends State<PartnerDetails> {
  List<PartnerModel> fields = [];

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      fields
          .add(PartnerModel(TextEditingController(), TextEditingController()));
      partnersBloc.updatePartnersData.add(fields);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColor.scaffoldBgWhite,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 180, right: 20),
        child: FloatingActionButton(
          onPressed: () {
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              fields.add(PartnerModel(
                  TextEditingController(), TextEditingController()));
              partnersBloc.updatePartnersData.add(fields);
            });
          },
          tooltip: 'Add A New Director/Partner',
          backgroundColor: DefaultColor.blueDark,
          child: new Icon(Icons.add),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
                    "Activate Limit",
                    style: TextStyle(
                        color: DefaultColor.blueDarkLogin,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: Text("Upload your bank statement to activate limit",
                      style:
                          TextStyle(color: DefaultColor.black, fontSize: 14)),
                ),
                StreamBuilder<List<PartnerModel>>(
                    stream: partnersBloc.getPartnersData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // fields.addAll(snapshot.data!);
                        print(snapshot.data!.length);
                        return Container(
                          height: MediaQuery.of(context).size.height / 2,
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                              physics: ScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                12,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          child: Center(
                                            child: TextField(
                                                controller: snapshot
                                                    .data![index].nameCont,
                                                keyboardType:
                                                    TextInputType.text,
                                                onChanged: (text) {},
                                                style: TextStyle(fontSize: 16),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(0),
                                                  isDense: true,
                                                  hintText:
                                                      "Enter Product Name",
                                                  border: InputBorder.none,
                                                )),
                                          ),
                                        ),
                                        margin: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: DefaultColor.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6))),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                12,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          child: Center(
                                            child: TextField(
                                                controller: snapshot
                                                    .data![index].panCont,
                                                keyboardType:
                                                    TextInputType.text,
                                                onChanged: (text) {},
                                                style: TextStyle(fontSize: 16),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(0),
                                                  isDense: true,
                                                  hintText: "Enter Brand Name",
                                                  border: InputBorder.none,
                                                )),
                                          ),
                                        ),
                                        margin: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 0),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: DefaultColor.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6))),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                      }
                      return Container();
                    }),
                SizedBox(
                  height: 10,
                ),
                AppButton(
                  buttonTitle: "Next",
                  onTap: () {
                    fields.forEach((element) {
                      print(element.nameCont.text);
                      print(element.panCont.text);
                    });
                    Navigator.pushNamed(context, "/StatementOption");
                  },
                ),
              ],
            ))
            /*})*/
            ),
      ),
    );
  }
}
