import 'package:flavor/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';

enum Flavor {
  development,
  production,
  staging,
  testing,
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
      case Flavor.staging:
        return 'Flavor staging';
      case Flavor.testing:
        return 'Flavor testing';
      default:
        return 'title';
    }
  }


  static String get getBodyTitle {
    switch (appFlavor) {
      case Flavor.development:
        return 'Flavor development Sign In';
      case Flavor.production:
        return 'Flavor production Sign In';
      case Flavor.staging:
        return 'Flavor staging Sign In';
      case Flavor.testing:
        return 'Flavor testing Sign In';
      default:
        return 'title';
    }
  }

  static String get getTitle {
    switch (appFlavor) {
      case Flavor.development:
        return 'Development';
      case Flavor.production:
        return 'Production';
      case Flavor.staging:
        return 'Staging';
      case Flavor.testing:
        return 'Testing';
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
      case Flavor.staging:
        return "assets/images/theatre.png";
      case Flavor.testing:
        return "assets/images/test.png";
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
      case Flavor.staging:
        return ColorSchemes.gray;
      case Flavor.testing:
        return ColorSchemes.white;
      default:
        return Colors.red;
    }
  }

  static bool get isProduction => appFlavor == Flavor.production;
  static bool get isDevelopment => appFlavor == Flavor.development;
  static bool get isStaging => appFlavor == Flavor.staging;
  static bool get isTesting => appFlavor == Flavor.testing;
}
