enum Routes {
  launch,
  login,
}

extension path on Routes {
  String get name {
    switch (this) {
      case Routes.launch:
        return '/';
      case Routes.login:
        return '/login';

      default: return "/";
    }
  }
}