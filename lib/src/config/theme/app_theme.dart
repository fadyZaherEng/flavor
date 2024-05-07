import 'package:flavor/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  String language;

  AppTheme(this.language);

  ThemeData get light {
    return ThemeData(
      useMaterial3: false,
      fontFamily: "OpenSans",
      toggleableActiveColor: ColorSchemes.primary,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorSchemes.white,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: ColorSchemes.primary,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(8),
        hintStyle: TextStyle(
            fontSize: 14,
            color: ColorSchemes.gray,
            letterSpacing: 0.26,
            fontWeight: FontWeight.normal),
        labelStyle: TextStyle(
            fontSize: 14,
            color: ColorSchemes.gray,
            fontWeight: FontWeight.normal),
        errorStyle: TextStyle(
            fontSize: 12,
            color: ColorSchemes.redError,
            fontWeight: FontWeight.normal),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.gray, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.gray, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.redError, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchemes.redError, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        alignLabelWithHint: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorSchemes.white,
        elevation: 10,
        selectedIconTheme: IconThemeData(
          color: ColorSchemes.primary,
          size: 24,
        ),
        unselectedIconTheme: IconThemeData(
          color: ColorSchemes.gray,
          size: 24,
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ColorSchemes.primary,
      splashColor: Colors.transparent,
    );
  }
}
