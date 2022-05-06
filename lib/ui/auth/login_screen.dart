import 'dart:async';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gmoney/bloc/authentication_bloc.dart';
import 'package:gmoney/bloc/otp_bloc.dart';
import 'package:gmoney/ui/widgets/otp_code_field.dart';
import 'package:gmoney/util/utils.dart';
import 'package:screen_loader/screen_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/constant/constants.dart';
import '../../util/user_data.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> with ScreenLoader {
  var textController = TextEditingController(text: "9920641456");
  int _counter = 0;
  final intRegex = RegExp(r'\d+', multiLine: true);
  var prefs;
  String mPin = "";
  String? token = "";
  bool gotoLogin = false;
  Timer? _timer;
  late StreamController<int> _events;

  String? id;

  String? model;
  String? version_id;
  bool exitApp = true;
  bool exitAppShowing = false;
  bool? login_status = false;

  FocusNode mobileFocusNode = FocusNode();

  Future getToken() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.containsKey(PREF_TOKEN)
        ? await prefs.getString(PREF_TOKEN) ?? ""
        : "";
    print("token at login screen ${prefs.getString(PREF_TOKEN)}");
    mPin = prefs.containsKey("mPin") ? await prefs.getString('mPin') ?? "" : "";
  }

  Future<void> _startTimer() async {
    _counter = 60;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      //setState(() {
      (_counter > 0) ? _counter-- : _timer!.cancel();
      //});
      print(_counter);
      _events.add(_counter);
    });
  }

  /// get signature code
  _getSignatureCode() async {
    //String? signature = await SmsVerification.getAppSignature();
    // print("signature $signature");
  }

  /// listen sms
  Future<bool?> _startListeningSms() async {
    var data = {"mobile": textController.text};
    bool login_status = false;
    startLoading();

    await authBloc.sendOtp(data).then((value) async {
      login_status = value;
      print(value);
      print(value);
      print("value2323");
      print(value);
      print("value");
      _counter = 60;
      _events.add(60);
      _startTimer();
      stopLoading();
      authBloc.otp.sink.add("12");

      // if(_timer!=null)validate(context);
      authBloc.readOTP().then((value) {
        // _otpCode = value;
        // otpController.text = authBloc.otp;
        // _onOtpCallBack(value, true);
      });
    });

    stopLoading();
    return login_status;
  }
  @override
  double? loadingBgBlur() {
    // TODO: implement loadingBgBlur
    return 5;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    mobileFocusNode.dispose();
    _timer?.cancel();
    _events.close();
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _events = new StreamController<int>.broadcast();
    _events.add(60);
    getToken();
    _getSignatureCode();
    super.initState();
  }

  validate(BuildContext context) {
    int secondsRemaining = 60;
    bool enableResend = false;
    Timer timer;

    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        secondsRemaining--;
      } else {
        enableResend = true;
      }
    });
    _timer!.cancel();
  }

  Future<void> initPlatformState() async {
    if (Platform.isIOS) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print('Running on ${iosInfo.utsname.nodename}');
      id = iosInfo.identifierForVendor;
      model = iosInfo.utsname.machine;
      version_id = iosInfo.utsname.version;
    } else if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print('Running on ${androidInfo.model}');
      id = androidInfo.androidId;
      model = androidInfo.model;
      version_id = androidInfo.id;
    }
    // e.g. "Moto G (4)"

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 2.5,
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
              Container(
                height: MediaQuery.of(context).size.height / 7,
                width: MediaQuery.of(context).size.width / 7,
                child: Image.asset("assets/images/Logo.png"),
                margin: EdgeInsets.symmetric(vertical: 10),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: DefaultColor.appBarWhite,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: DefaultColor.blueDarkLogin,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 15),
                        child: Text("Please enter your mobile number",
                            style: TextStyle(
                                color: DefaultColor.blackSubText,
                                fontSize: 16)),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 11,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 6),
                              child: Text(
                                "Mobile Number",
                                style:
                                TextStyle(color: DefaultColor.blueMobile),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 6),
                              child: TextField(
                                  focusNode: mobileFocusNode,
                                  controller: textController,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  onChanged: (text) {
                                    if (gotoLogin && text.length == 10) {
                                      print("gotoLogin");
                                      print(gotoLogin);
                                      _startListeningSms();
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(0),
                                    isDense: true,
                                    border: InputBorder.none,
                                  )),
                            ),
                          ],
                        ),
                        margin:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: DefaultColor.blueMobile),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                      ),
                      StreamBuilder<String>(
                          stream: otpBloc.loginOtpStream,
                          builder: (context, snapshotOtp) {
                            // if (snapshot.hasData) {
                            //   return Column(
                            //     children: [
                            //       Padding(
                            //         padding: const EdgeInsets.symmetric(
                            //             horizontal: 20, vertical: 10),
                            //         child: Text(
                            //           "Please enter the OTP sent on your registered mobile number",
                            //           style: TextStyle(
                            //               color: DefaultColor.blackSubText,
                            //               fontSize: 16),
                            //         ),
                            //       ),
                            //       OtpCodeField(
                            //           isEnabled: true,
                            //           isFrom: "Login",
                            //           length: 4),
                            //       Center(
                            //         child: Padding(
                            //           padding: const EdgeInsets.symmetric(
                            //               horizontal: 20, vertical: 20),
                            //           child: ElevatedButton(
                            //             onPressed: () async {
                            //               if (textController.text.length > 9 &&
                            //                   snapshot.data != null &&
                            //                   snapshot.data!.length > 3) {
                            //                 startLoading();
                            //                 authBloc.verifyOtp({
                            //                   "mobile": textController.text,
                            //                   "mobileotp": snapshot.data
                            //                 }).then((value) {
                            //                   if (value) {
                            //                     Navigator.of(context)
                            //                         .pushNamedAndRemoveUntil(
                            //                             '/CreateMPinScreen',
                            //                             (Route<dynamic>
                            //                                     route) =>
                            //                                 false);
                            //                     stopLoading();
                            //                   }
                            //                 });
                            //                 stopLoading();
                            //               } else if (textController
                            //                       .text.length <
                            //                   10) {
                            //                 ScaffoldMessenger.of(context)
                            //                     .showSnackBar(SnackBar(
                            //                         content: Text(
                            //                             "Please enter valid phone number")));
                            //                 stopLoading();
                            //               }
                            //
                            //               // Navigator.of(context).pushNamedAndRemoveUntil(
                            //               //     '/CreateMPinScreen', (Route<dynamic> route) => false);
                            //             },
                            //             child: StreamBuilder<String>(
                            //                 stream: authBloc.otp,
                            //                 builder: (context, snapshot) {
                            //                   if (snapshot.hasData) {
                            //                     gotoLogin = true;
                            //                     return Text(
                            //                       "Login",
                            //                       style: TextStyle(
                            //                           color: DefaultColor
                            //                               .appBarWhite),
                            //                     );
                            //                   } else {
                            //                     return Text(
                            //                       "Send OTP",
                            //                       style: TextStyle(
                            //                           color: DefaultColor
                            //                               .appBarWhite),
                            //                     );
                            //                   }
                            //                 }),
                            //             style: ButtonStyle(
                            //               padding: MaterialStateProperty.all<
                            //                       EdgeInsets>(
                            //                   EdgeInsets.symmetric(
                            //                       vertical: 15, horizontal: 0)),
                            //               minimumSize:
                            //                   MaterialStateProperty.all<Size>(
                            //                       const Size(
                            //                           double.infinity, 50)),
                            //               backgroundColor:
                            //                   MaterialStateProperty.all<Color>(
                            //                       DefaultColor.blueDark),
                            //               shape: MaterialStateProperty.all<
                            //                       RoundedRectangleBorder>(
                            //                   RoundedRectangleBorder(
                            //                 borderRadius: BorderRadius.all(
                            //                     Radius.circular(8)),
                            //               )),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   );
                            // }
                            return Column(
                              children: [
                                StreamBuilder<String>(
                                    stream: authBloc.otp,
                                    builder: (context, snapshot) {
                                      return Column(
                                        children: [
                                          Offstage(
                                            offstage: gotoLogin ? false : true,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical: 10),
                                              child: Text(
                                                "Please enter the OTP sent on your registered mobile number",
                                                style: TextStyle(
                                                    color: DefaultColor
                                                        .blackSubText,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          Offstage(
                                            offstage: gotoLogin ? false : true,
                                            child: OtpCodeField(
                                                isEnabled: true,
                                                isFrom: "Login",
                                                length: 4),
                                          ),
                                          Center(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical: 20),
                                              child: ElevatedButton(
                                                onPressed: () async {
                                                  print("login_status22222");

                                                  print(login_status);
                                                  print(gotoLogin);
                                                  if (!gotoLogin) {
                                                    if (!gotoLogin &&
                                                        textController
                                                            .text.length >
                                                            9) {
                                                      await _startListeningSms()
                                                          .then((value) {
                                                        print("otp sent1");
                                                        print(value);
                                                        print("value");
                                                        print(value);
                                                        print("value");
                                                        if (value != null &&
                                                            value) {
                                                          gotoLogin = true;
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                              mobileFocusNode);
                                                        }
                                                      });
                                                      print("login_status3333");
                                                      print(login_status);
                                                      print(gotoLogin);
                                                      print("otp sent2");

                                                      // FocusScope.of(context)
                                                      //     .requestFocus(
                                                      //         mobileFocusNode);
                                                      // _startTimer();
                                                      //  if (_timer != null) validate(context);
                                                    }
                                                  } else {
                                                    if (textController
                                                        .text.length >
                                                        9 &&
                                                        snapshotOtp.data !=
                                                            null &&
                                                        snapshotOtp
                                                            .data!.length >
                                                            3) {

                                                      EasyLoading.show();
                                                      print("otp verify hitt");
                                                      await authBloc.verifyOtp({
                                                        "mobile":
                                                        textController.text,
                                                        "mobileotp":
                                                        snapshotOtp.data
                                                      }).then((value) async {
                                                        print("hittt success");
                                                        print(value);

                                                        if (value) {
                                                          if (Platform
                                                              .isAndroid) {
                                                            print("sms dump");

                                                            UserData
                                                                .getUserData();
                                                            EasyLoading.dismiss();
                                                          }
                                                          EasyLoading
                                                              .dismiss();
                                                          // Navigator.of(
                                                          //     context)
                                                          //     .pushNamedAndRemoveUntil(
                                                          //     '/CreateMPinScreen',
                                                          //         (Route<dynamic>
                                                          //     route) =>
                                                          //     false);
                                                          await initPlatformState();

                                                          print("device ID");
                                                          if (id != null ||
                                                              id!.isNotEmpty) {
                                                            prefs =
                                                            await SharedPreferences
                                                                .getInstance();
                                                            String device_id = await prefs
                                                                .containsKey(
                                                                "device_id")
                                                                ? await prefs
                                                                .getString(
                                                                "device_id") ??
                                                                ""
                                                                : "";
                                                            print(id);
                                                            print(device_id);
                                                            print("id");
                                                            if (device_id
                                                                .isEmpty||device_id ==
                                                                id
                                                            ) {
                                                              EasyLoading
                                                                  .dismiss();
                                                              Navigator.of(
                                                                  context)
                                                                  .pushNamedAndRemoveUntil(
                                                                  '/CreateMPinScreen',
                                                                      (Route<dynamic>
                                                                  route) =>
                                                                  false);

                                                            } else {
                                                              WidgetsBinding
                                                                  .instance!
                                                                  .addPostFrameCallback(
                                                                      (_) =>
                                                                      afterBuild());

/*
                                                              Utils.instance
                                                                  .showToast(
                                                                      "You are trying to log with different devices please contact GMoney support team");
*/
                                                            }
                                                          }
                                                        }
                                                      });
                                                      EasyLoading.dismiss();
                                                      stopLoading();
                                                    } else if (textController
                                                        .text.length <
                                                        10) {
                                                      EasyLoading.dismiss();
                                                      ScaffoldMessenger.of(
                                                          context)
                                                          .showSnackBar(SnackBar(
                                                          content: Text(
                                                              "Please enter valid phone number")));
                                                      stopLoading();
                                                    }
                                                  }

                                                  // Navigator.of(context).pushNamedAndRemoveUntil(
                                                  //     '/CreateMPinScreen', (Route<dynamic> route) => false);
                                                },
                                                child: gotoLogin == true
                                                    ? Text(
                                                  "Login",
                                                  style: TextStyle(
                                                      color: DefaultColor
                                                          .appBarWhite),
                                                )
                                                    : Text(
                                                  "Send OTP",
                                                  style: TextStyle(
                                                      color: DefaultColor
                                                          .appBarWhite),
                                                ),
                                                style: ButtonStyle(
                                                  padding: MaterialStateProperty
                                                      .all<EdgeInsets>(
                                                      EdgeInsets.symmetric(
                                                          vertical: 15,
                                                          horizontal: 0)),
                                                  minimumSize:
                                                  MaterialStateProperty
                                                      .all<Size>(const Size(
                                                      double.infinity,
                                                      50)),
                                                  backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(
                                                      DefaultColor
                                                          .blueDark),
                                                  shape: MaterialStateProperty
                                                      .all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                      )),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Offstage(
                                            offstage: gotoLogin ? false : true,
                                            child: StreamBuilder<int>(
                                                stream: _events.stream,
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<int>
                                                    snapshot) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      if (!gotoLogin) {
                                                        Utils.instance.showToast(
                                                            "Please send OTP first");
                                                        return;
                                                      }
                                                      if (snapshot.data! > 0) {
                                                        Utils.instance.showToast(
                                                            "Please let the counter finish");
                                                        return;
                                                      }
                                                      print("${snapshot.data}");
                                                      if (_counter == 0 &&
                                                          textController.text
                                                              .isNotEmpty &&
                                                          textController
                                                              .text.length >
                                                              9) {
                                                        _startListeningSms();
                                                        print("otp sent");
                                                      } else {
                                                        Utils.instance.showToast(
                                                            "Please enter valid phone number");
                                                      }
                                                    },
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.all(
                                                          8.0),
                                                      child: Center(
                                                        child: Text.rich(
                                                          TextSpan(
                                                            text: 'Resend OTP',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color:
                                                                DefaultColor
                                                                    .blackTC,
                                                                decoration:
                                                                TextDecoration
                                                                    .underline),
                                                            children: <
                                                                TextSpan>[
                                                              _counter != 0
                                                                  ? TextSpan(
                                                                  text:
                                                                  ' ( ${snapshot.data.toString()} sec)',
                                                                  style:
                                                                  TextStyle(
                                                                    decoration:
                                                                    TextDecoration.none,
                                                                  ))
                                                                  : TextSpan(
                                                                  text: '',
                                                                  style:
                                                                  TextStyle(
                                                                    decoration:
                                                                    TextDecoration.none,
                                                                  )),
                                                              // can add more TextSpans here...
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ],
                                      );
                                    }),
                              ],
                            );
                            // return Column(
                            //   children: [
                            //     StreamBuilder<String>(
                            //         stream: authBloc.otp,
                            //         builder: (context, snapshot) {
                            //           if (snapshot.hasData) {
                            //             gotoLogin = true;
                            //           }
                            //           return Offstage(
                            //             offstage:
                            //                 gotoLogin == false ? true : false,
                            //             child: Padding(
                            //               padding: const EdgeInsets.symmetric(
                            //                   horizontal: 20, vertical: 10),
                            //               child: Text(
                            //                 "Please enter the OTP sent on your registered mobile number",
                            //                 style: TextStyle(
                            //                     color:
                            //                         DefaultColor.blackSubText,
                            //                     fontSize: 16),
                            //               ),
                            //             ),
                            //           );
                            //         }),
                            //     StreamBuilder<String>(
                            //         stream: authBloc.otp,
                            //         builder: (context, snapshot) {
                            //           if (snapshot.hasData) {
                            //             gotoLogin = true;
                            //           }
                            //           return Offstage(
                            //               offstage:
                            //                   gotoLogin == false ? true : false,
                            //               child: OtpCodeField(
                            //                   isEnabled: true,
                            //                   isFrom: "Login",
                            //                   length: 4));
                            //         }),
                            //     Center(
                            //       child: Padding(
                            //         padding: const EdgeInsets.symmetric(
                            //             horizontal: 20, vertical: 20),
                            //         child: ElevatedButton(
                            //           onPressed: () async {
                            //             if (!gotoLogin &&
                            //                 textController.text.length > 9) {
                            //               _startListeningSms();
                            //               authBloc.otp.sink.add("otp");
                            //
                            //               // _startTimer();
                            //               //  if (_timer != null) validate(context);
                            //             }
                            //           },
                            //           child: StreamBuilder<String>(
                            //               stream: authBloc.otp,
                            //               builder: (context, snapshot) {
                            //                 if (snapshot.hasData) {
                            //                   gotoLogin = true;
                            //                   return Text(
                            //                     "Login",
                            //                     style: TextStyle(
                            //                         color: DefaultColor
                            //                             .appBarWhite),
                            //                   );
                            //                 } else {
                            //                   return Text(
                            //                     "Send OTP",
                            //                     style: TextStyle(
                            //                         color: DefaultColor
                            //                             .appBarWhite),
                            //                   );
                            //                 }
                            //               }),
                            //           style: ButtonStyle(
                            //             padding: MaterialStateProperty.all<
                            //                     EdgeInsets>(
                            //                 EdgeInsets.symmetric(
                            //                     vertical: 15, horizontal: 0)),
                            //             minimumSize: MaterialStateProperty.all<
                            //                     Size>(
                            //                 const Size(double.infinity, 50)),
                            //             backgroundColor:
                            //                 MaterialStateProperty.all<Color>(
                            //                     DefaultColor.blueDark),
                            //             shape: MaterialStateProperty.all<
                            //                     RoundedRectangleBorder>(
                            //                 RoundedRectangleBorder(
                            //               borderRadius: BorderRadius.all(
                            //                   Radius.circular(8)),
                            //             )),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // );
                          }),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  afterBuild() {
    exitApp = false;
    exitAppShowing = true;
    return showDialog(
      //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('GMoney'),
        content: Text(
            'You are trying to login with a different device, please contact our GMoney support team on 022-49361515'),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                Navigator.of(context).pop();
                exit(0);
              },
              //return false when click on "NO"
              child: Text('Ok'),
            ),
          )
        ],
      ),
    ).then((value) => exit(0));
  }
}
