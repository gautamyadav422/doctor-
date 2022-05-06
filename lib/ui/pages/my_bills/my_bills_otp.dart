import 'package:flutter/material.dart';
import 'package:gmoney/bloc/consumer_home.dart';
import 'package:gmoney/models/policy_offerId_model.dart';
import 'package:gmoney/ui/pages/my_bills/my_bills_screen.dart';
import 'package:gmoney/ui/widgets/CommonCustomBg.dart';
import 'package:gmoney/ui/widgets/appBar_backArrow.dart';
import 'package:gmoney/ui/widgets/app_button.dart';
import 'package:gmoney/util/utils.dart';
import 'package:screen_loader/screen_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../bloc/authentication_bloc.dart';
import '../../../bloc/my_bills/my_bills_bloc.dart';
import '../../../bloc/otp_bloc.dart';
import '../../widgets/otp_code_field.dart';

class MyBillsOtp extends StatelessWidget with ScreenLoader {
  final id;

  String? otp;

  MyBillsOtp({Key? key, this.id}) : super(key: key);

  Widget thankYouUI() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Thank you for using GMoney !!! Please wait for approval",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: AppButton(
            onTap: () {},
            buttonTitle: "Ok",
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColor.scaffoldBgWhite,
      body: CommonCustomBG(
        widgetsOverGradient: AppBarBackArrow(
            title: "My Bills", onTap: () => Navigator.pop(context)),
        widgetOverCard: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Please enter the OTP sent on your registered mobile number",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
            ),
            StreamBuilder<String>(
                stream: otpBloc.loginOtpStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    otp = snapshot.data;
                  }
                  return OtpCodeField(
                      length: 4, isFrom: "Login", isEnabled: true);
                }),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: StreamBuilder<PolicyOfferId>(
                    stream: consumerHome.getOfferIdPolicy,
                    builder: (context, snapshot) {
                      return AppButton(
                        onTap: () async {
                          if (otp == null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Please enter 4 digit otp")));
                            Utils.instance.showToast("Please enter 4 digit otp",
                                isBottom: false);
                            return;
                          }
                          if (otp != null && otp!.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Please enter 4 digit otp")));
                            Utils.instance.showToast("Please enter 4 digit otp",
                                isBottom: false);
                            return;
                          }
                          if (otp != null && otp!.length < 4) {
                            Utils.instance.showToast("Please enter 4 digit otp",
                                isBottom: false);

                            return;
                          }
                          var sp = await SharedPreferences.getInstance();

                          var otpData = {
                            "mobile": sp.getString("userMobile")!,
                            "mobileotp": otp
                          };
                          startLoading();
                          await authBloc.verifyOtp(otpData).then((value) async {
                            if (value != null && value) {
                              var _params = Map<String, dynamic>();
                              _params['offerId'] = snapshot.data!.offerId;
                              _params['accepted'] = true;
                              _params['cardId'] = this.id;
                              _params['policy'] = snapshot.data!.policy;
                              await myBillsBloc
                                  .updateBillsStatus(_params)
                                  .then((value) async {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => MyBillsScreen(),
                                    ),
                                    (route) => route.isFirst);

                                stopLoading();
                              });
                              //Navigator.popAndPushNamed(context, "/MyBillsScreen");
                              //Hit Submit Api here

                            } else {
                              stopLoading();
                              Utils.instance
                                  .showToast("Something went wrong with otp");
                            }
                          });
                          stopLoading();
                        },
                        buttonTitle: "Submit",
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
