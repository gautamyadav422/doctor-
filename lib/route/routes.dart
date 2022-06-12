enum Routes {
  launch,
  mobileNumber,
}

extension path on Routes {
  String get name {
    switch (this) {
      case Routes.launch:
        return '/';
      case Routes.mobileNumber:
        return '/mobile_number';

      default: return "/";
    }
  }
}