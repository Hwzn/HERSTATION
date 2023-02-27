import 'package:flutter/material.dart';
import 'package:hwzn_herstation/general/helper/dio/dio_helper/DioImports.dart';

class DioUtils {
  static late TextStyle textStyle;
  static late Color primaryColor;
  static late String authRoute;
  static late String lang;
  static late String? authConfirm;
  static late String? authBack;
  static late String? authSentence;
  static late Function() dismissDialog;
  static late Function()? onAuthClick;
  static late Function() showLoadingDialog;
  static late Map<String, String>? header;
  static late InputDecoration Function(
      {String? label,
      String? hint,
      Widget? prefixIcon,
      Color? hintColor,
      Color? fillColor,
      Widget? suffixIcon,
      EdgeInsets? padding,
      BorderRadius? radius,
      Color? focusBorderColor,
      Color? enableColor}) setInputDecoration;

  static init({
    required String baseUrl,
    String? branch,
    String? branchKey,
    required TextStyle style,
    required Color primary,
    required String authLink,
    required String language,
    String? authConfirm,
    String? authBack,
    String? authSentence,
    Map<String, String>? dio_header,
    required Function() dismissFunc,
    required Function()? authClick,
    required Function() showLoadingFunc,
    required InputDecoration Function(
        {String? label,
        String? hint,
        Widget? prefixIcon,
        Widget? suffixIcon,
        Color? hintColor,
        Color? fillColor,
        BorderRadius? radius,
        Color? focusBorderColor,
        EdgeInsets? padding,
        Color? enableColor})
    inputStyle,
  }) {
    textStyle = style;
    primaryColor = primary;
    authRoute = authLink;
    lang = language;
    dismissDialog = dismissFunc;
    onAuthClick = authClick;
    DioUtils.authConfirm = authConfirm;
    DioUtils.authBack = authBack;
    DioUtils.authSentence = authSentence;
    showLoadingDialog = showLoadingFunc;
    DioUtils.header = dio_header;
    DioHelper.init(baseUrl: baseUrl, branch: branch, branchKey: branchKey);
    setInputDecoration = inputStyle;
  }
}
