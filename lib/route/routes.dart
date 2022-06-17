enum Routes { launch, login, signup,businesDetail }

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

      default:
        return "/";
    }
  }
}
