import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constant/color_constant.dart';

class Utils {

  static showToast(String message, {bool isBottom = true}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorConstant.greyBanner,
        textColor: Colors.black,
        fontSize: 16.0);
  }

}
