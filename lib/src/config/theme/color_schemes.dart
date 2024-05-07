import 'package:flavor/flavors.dart';
import 'package:flutter/material.dart';

class ColorSchemes {
  static Color primary = F.isProduction
      ? const Color.fromRGBO(43, 54, 149, 1)
      : const Color.fromRGBO(114, 16, 255, 1);
  static const Color black = Color.fromRGBO(34, 34, 34, 1);
  static const Color logo = Color.fromRGBO(193, 153, 249, 1);
  static const Color redError = Color.fromRGBO(231, 54, 37, 1);
  static const Color border = Color.fromRGBO(217, 217, 217, 1);
  static const Color gray = Color.fromRGBO(153, 153, 153, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
}
