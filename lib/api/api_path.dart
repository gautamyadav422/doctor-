class APIPath {

  static const String devBaseUrl = 'https://staging.gmoney.loans/api/v1';
  static const String prodBaseUrl = 'https://staging.gmoney.loans/api/v1';

  static const String sendOTPUrl = '/users/auth/otp/';
  static const String getCountryCode = '/common/manage-country/';
  static const String verifyOTPUrl = '/users/auth/otp/verify/';
  static const String preExistingConsumer = '/users/auth/pre-login/';
  static const String getEntity = '/common/manage-user-type-profile/';
  static const String verifyPan = '/common/pan-profile/';

}