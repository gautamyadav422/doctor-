class StringUtil {

  static bool? validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regex = new RegExp(patttern.toString());
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static bool? validateOTP(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{4,4}$)';
    RegExp regex = new RegExp(patttern.toString());
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

}