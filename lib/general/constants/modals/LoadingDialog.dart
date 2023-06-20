import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hwzn_herstation/general/constants/MyColors.dart';
import 'package:hwzn_herstation/general/helper/dio/utils/DioUtils.dart';

class CustomToast{

  static showConfirmDialog({required BuildContext context, required String title, required Function() confirm}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return _alertDialog(title, confirm, context, "تأكيد");
      },
    );
  }

  static showBottomDialog({required BuildContext context, required WidgetBuilder widget}) {
    return showModalBottomSheet(
        context: context,

        builder: (context) {
          return widget(context);
        });
  }

  static showAuthDialog({required BuildContext context}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return _alertDialog(
            DioUtils.authSentence??"قم بتسجيل الدخول للمتابعة",
            DioUtils.onAuthClick,
            context,
            DioUtils.authConfirm??"دخول");
      },
    );
  }

  static Widget _alertDialog(String title, Function()? confirm, BuildContext context, String okText) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: DioUtils.textStyle.copyWith(
          color: Colors.black,
        ),
      ),
      // content: MyText(title: title,size: 12,color: MyColors.blackOpacity,),
      actions: [
        CupertinoDialogAction(
          child: Text(
            DioUtils.authBack??"رجوع",
            style: DioUtils.textStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          onPressed: confirm,
          child: Text(
            okText,
            style: DioUtils.textStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  static showToastNotification(msg, {Color? color, Color? textColor, ToastGravity? toastGravity}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: toastGravity ?? ToastGravity.BOTTOM,
        backgroundColor: color ?? DioUtils.primaryColor,
        textColor: textColor ?? Colors.white,
        fontSize: 16.0);
  }

  static showSimpleToast({required String msg, Color? color, Color? textColor}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color ?? MyColors.blackOpacity,
        textColor: textColor ?? Colors.white,
        fontSize: 16.0);
  }

}
