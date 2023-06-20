import 'package:flutter/material.dart';

class DecorationUtils {
  static late String lang;
  static late TextStyle textStyle;
  static String? fontFamily;
  static double? textScaleFactor;
  static late InputDecoration Function({
    String? label,
    String? hint,
    Widget? prefixIcon,
    Color? hintColor,
    Color? fillColor,
    Widget? suffixIcon,
    EdgeInsets? padding,
    double? radius,
    Color? focusBorderColor,
    Color? enableColor,
    double? hintSize,
  }) setInputDecoration;
  static late Color primaryColor;

  static init(
      {required TextStyle style,
      required Color primary,
      required String language,
      String? myTextFontFamily,
      double? scaleFactor,
      required InputDecoration Function({
        String? label,
        String? hint,
        Widget? prefixIcon,
        Widget? suffixIcon,
        Color? hintColor,
        Color? fillColor,
        double? radius,
        Color? focusBorderColor,
        EdgeInsets? padding,
        Color? enableColor,
        double? hintSize,
      })inputStyle}) {
    textStyle = style;
    primaryColor = primary;
    fontFamily = myTextFontFamily;
    textScaleFactor = scaleFactor;
    lang = language;
    setInputDecoration = inputStyle;
  }
}
