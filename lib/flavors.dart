import 'package:flutter/material.dart';

enum Flavor {
  development,
  production,
  flutterdev,
  flutterprod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.development:
        return 'Flavor development';
      case Flavor.production:
        return 'Flavor production';
      case Flavor.flutterdev:
        return 'flutter development';
      case Flavor.flutterprod:
        return 'flutter production';
      default:
        return 'title';
    }
  }

  static String get getIcon {
    switch (appFlavor) {
      case Flavor.development:
        return "assets/images/development.png";
      case Flavor.production:
        return "assets/images/production.png";
      default:
        return 'assets/images/development.png';
    }
  }

  static Color get getBodyColor {
    switch (appFlavor) {
      case Flavor.development:
        return Colors.black;
      case Flavor.production:
        return Colors.teal;
      default:
        return Colors.red;
    }
  }

  static bool get isProduction => appFlavor == Flavor.production;
}
