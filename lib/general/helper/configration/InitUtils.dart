import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hwzn_herstation/general/constants/MyColors.dart';
import 'package:hwzn_herstation/general/constants/input_field_style/CustomInputDecoration.dart';
import 'package:hwzn_herstation/general/constants/input_field_style/CustomInputTextStyle.dart';
import 'package:hwzn_herstation/general/helper/configration/DecorationUtils.dart';
import 'package:hwzn_herstation/general/helper/dio/utils/DioUtils.dart';
import 'package:hwzn_herstation/general/utilities/routers/RouterImports.gr.dart';
import 'package:hwzn_herstation/general/utilities/utils_functions/ApiNames.dart';
import 'package:hwzn_herstation/general/utilities/utils_functions/LoadingDialog.dart';

class InitUtils {
  static ThemeData defaultThem = ThemeData(
    primarySwatch: Colors.grey,
    focusColor: MyColors.primary,
    hintColor: MyColors.primary,
    primaryColor: MyColors.primary,
    fontFamily: GoogleFonts.tajawal().fontFamily,
    textTheme: TextTheme(
      subtitle1: GoogleFonts.tajawal(fontSize: 14),
    ),
  );

  static initDio({required String lang}) async {
    DioUtils.init(
      baseUrl: ApiNames.baseUrl,
      style: CustomInputTextStyle(lang: lang),
      primary: MyColors.primary,
      authLink: LoginRoute.name,
      language: lang,
      dismissFunc: EasyLoading.dismiss,
      showLoadingFunc: LoadingDialog.showLoadingDialog,
      branch: ApiNames.branch,
      authClick: () {},
      inputStyle: (
              {String? label,
              String? hint,
              Widget? prefixIcon,
              Widget? suffixIcon,
              Color? hintColor,
              Color? fillColor,
              BorderRadius? radius,
              Color? focusBorderColor,
              EdgeInsets? padding,
              Color? enableColor}) =>
          CustomInputDecoration(
              lang: "ar",
              labelTxt: label,
              hint: hint,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              enableColor: enableColor,
              customFillColor: fillColor,
              padding: padding),
    );
  }

  static initCustomWidgets({required String language}) {
    DecorationUtils.init(
        style: CustomInputTextStyle(
          lang: language,
        ),
        primary: MyColors.primary,
        language: language,
        inputStyle: (
                {String? label,
                String? hint,
                Widget? prefixIcon,
                Widget? suffixIcon,
                Color? hintColor,
                Color? fillColor,
                double? radius,
                Color? focusBorderColor,
                EdgeInsets? padding,
                Color? enableColor,
                double? hintSize}) =>
            CustomInputDecoration(
                lang: language,
                labelTxt: label,
                hint: hint,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                enableColor: enableColor,
                customFillColor: fillColor,
                padding: padding,
                borderRaduis: radius,
                focusColor: focusBorderColor,
                hintSize: hintSize,
                hintColor: hintColor));
  }
}
