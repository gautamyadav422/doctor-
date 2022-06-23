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

  static bool? validatePan(String value) {
    String patttern = '[A-Z]{5}[0-9]{4}[A-Z]{1}';
    RegExp regex = new RegExp(patttern.toString());
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static bool? validatePin(String value) {
    String patttern = '^[1-9]{1}[0-9]{2}\\s{0,1}[0-9]{3}';
    RegExp regex = new RegExp(patttern.toString());
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }
  static bool? validateGst(String value) {
    String patttern = "^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}";
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