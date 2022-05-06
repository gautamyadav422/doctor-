import 'package:flutter/material.dart';
import 'package:gmoney/bloc/authentication_bloc.dart';
import 'package:gmoney/bloc/consumer_home.dart';
import 'package:gmoney/models/consumer_home_model.dart';
import 'package:gmoney/models/policy_offerId_model.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/util/utils.dart';
import 'package:screen_loader/screen_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../bloc/my_bills/my_bills_bloc.dart';

class SelectCard extends StatefulWidget {

  @override
  State<SelectCard> createState() => _SelectCardState();
}

class _SelectCardState extends State<SelectCard> with ScreenLoader {

  var cardId;
  int? _groupValue = -1;
  Widget _row(String _cardNumber, int _index, String _cardImg, String id) {
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
                      cardId = id;
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: StreamBuilder<ConsumerHomeModel>(
          stream: consumerHome.homeData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Utils.instance.loader(context);
            }
            var _data = snapshot.data!.data!.cards!;
            return Wrap(
              children: <Widget>[
                ListView.builder(
                    padding: EdgeInsets.only(bottom: 15),
                    shrinkWrap: true,
                    itemCount: _data.length,
                    itemBuilder: (context, index) {
                      return _row(
                          _data[index].cardNumber.toString(),
                          _data.indexOf(_data[index]),
                          _data[index].type!.cardImage.toString(),
                          _data[index].sId.toString());
                    }),
                AppButton(
                  onTap: () async {
                    print("card id >>>$cardId");
                    if(cardId == null) {
                        Utils.instance.showToast("Please select a card");
                    }else{
                      startLoading();
                      var sp = await SharedPreferences.getInstance();
                      var data = {
                        "mobile": sp.getString("userMobile")!
                      };
                      authBloc.sendOtp(data).then((value) {
                        if (value["status"] != null && value["status"]) {
                          stopLoading();
                          Navigator.pushNamed(context, "/MyBillsOtp",
                              arguments: cardId)
                              .then((value) => Navigator.pop(context));
                        } else {
                          stopLoading();

                          Utils.instance.showToast(
                              "Something went wrong with otp");
                        }
                      });
                      stopLoading();}},
                  buttonTitle: "Request to Pay",
                )
              ],
            );
          }),
    );
  }
}
