enum Routes { launch, login, signup,businesDetail,emailVerify,aadhaarVerify,hospitalDetails}

extension path on Routes {
  String get name {
    switch (this) {
      case Routes.launch:
        return '/';
      case Routes.login:
        return '/login';
      case Routes.signup:
        return '/signup';
      case Routes.businesDetail:
        return '/businesDetail';
      case Routes.emailVerify:
        return '/emailVerify';
      case Routes.aadhaarVerify:
        return '/aadhaarVerify';
      case Routes.hospitalDetails:
        return '/hospitalDetails';

      default:
        return "/";
    }
  }
}
