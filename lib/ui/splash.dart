import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gmoney/util/constant/constants.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late SharedPreferences prefs;
  String mPin = "";
  Future getToken() async {
    prefs = await SharedPreferences.getInstance();
    var _sToken = prefs.getString(PREF_TOKEN);
    if (prefs.containsKey('mPin') &&
        prefs.getString('mPin') != null &&
        prefs.getString('mPin') != "null") mPin = prefs.getString('mPin')!;
    return _sToken;
  }

  @override
  void initState() {
    super.initState();
    // callDummy();
    //getPermissionData();

    Timer(
        Duration(seconds: 3),
        () => {

             getToken().then((token) {
                print('token');
                print(token);
                print(mPin);


                if ((token == null || token.toString().isEmpty) &&
                    mPin.length <= 0)
                   Navigator.of(context)
                     .pushReplacementNamed('/TutorialScreens');


                else if ((token != null || token.toString().isNotEmpty) &&
                    mPin.length <= 0) {
                  /// enter m pin screen
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/CreateMPinScreen', (Route<dynamic> route) => false);
                } else {
                   Navigator.of(context).pushNamedAndRemoveUntil(
                       '/PinAuthScreen',
                       (Route<dynamic> route) => false);
                }
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    // callException();
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: <Widget>[
        Image.asset(
          'assets/images/Rectangle 4272.png',
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Image.asset(
          'assets/images/Logo.png',
        ),
      ],
    )
            );
  }

  Future<void> callException() async {
    try {
      throw PlatformException(code: "code");
    } catch (exception, stackTrace) {
      print('exception');
      print(exception);
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }
}

Future<void> callDummy() async {
  var sp = await SharedPreferences.getInstance();
  sp.setString(PREF_TOKEN, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MjM1ZGJjM2NiNjY4OWU1YjA3MTcwMTQiLCJpYXQiOjE2NDk4NDUyOTgsImV4cCI6MTY0OTg0ODg5OH0.D9w4hmLYtZYoirMeSE5scBcm2OOKRBdK1DbAXuZ7-wI');
}
/*ListView.builder(itemBuilder: (context, index) {
return Padding(
padding: const EdgeInsets.symmetric(horizontal: 20),
child: TimelineTile(
axis: TimelineAxis.vertical,
afterLineStyle: LineStyle(color: DefaultColor.blueDark),
beforeLineStyle: LineStyle(color: DefaultColor.blueLightGradient),
isFirst:index==0?true:false,
isLast: index==4?true:false,
hasIndicator: true,
lineXY: 50,
endChild: Text("vfjnvfnv"),
alignment: TimelineAlign.center,
indicatorStyle: IndicatorStyle(
drawGap: false,

)),
);
},itemCount: 5),*/
/*ListView.builder(itemBuilder: (context, index) {
return Padding(
padding: const EdgeInsets.symmetric(horizontal: 20),
child: TimelineTile(
axis: TimelineAxis.vertical,
afterLineStyle: LineStyle(color: DefaultColor.blueDark),
beforeLineStyle: LineStyle(color: DefaultColor.blueLightGradient),
isFirst:index==0?true:false,
isLast: index==4?true:false,
hasIndicator: true,
lineXY: 50,
endChild: Text("vfjnvfnv"),
alignment: TimelineAlign.center,
indicatorStyle: IndicatorStyle(
drawGap: false,

)),
);
},itemCount: 5),*/
