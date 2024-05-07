import 'package:flutter/material.dart';

enum Flavor {
  development,
  production,
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
      default:
        return 'title';
    }
  }

  static String get getBodyTitle {
    switch (appFlavor) {
      case Flavor.development:
        return 'Flavor development Body';
      case Flavor.production:
        return 'Flavor production Body';
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
}