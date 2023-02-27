import 'package:flutter/material.dart';
import 'package:hwzn_herstation/general/packages/localization/Localizations.dart';

extension Validator on String {

  String? noValidate() {
    return null;
  }

  String? validateEmpty(BuildContext context,{String? message}) {
    if (trim().isEmpty) {
      return message ?? "Please fill this field";
    }
    return null;
  }

  String? validatePassword(BuildContext context,{String? message}) {
    if (trim().isEmpty) {
      return message ?? "Please fill this field";
    } else if (!RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{6,}$')
        .hasMatch(this)) {
      return message ?? "Enter at least 6 characters containing numbers and letters";
    }
    return null;
  }

  String? validateEmail(BuildContext context,{String? message}) {
    if (trim().isEmpty) {
      return message ?? "Please fill this field";
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this)) {
      return message ?? tr(context,"mailValidation");
    }
    return null;
  }

  String? validateEmailORNull(BuildContext context,{String? message}) {
    if (trim().isNotEmpty) {
      if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(this)) {
        return message ?? tr(context,"mailValidation");
      }
    }
    return null;
  }

  String? validatePhone(BuildContext context,{String? message}) {
    if (trim().isEmpty) {
      return message ?? "Please fill this field";
    } else if (!startsWith("05", 0) ||
        this.length > 14 || this.length < 9) {
      return message ?? "Phone must contain at least 9 numbers staring with 05";
    }
    return null;
  }

  String? validatePasswordConfirm(BuildContext context,{required String pass, String? message}) {
    if (trim().isEmpty) {
      return message ?? "Please fill this field";
    } else if (this != pass) {
      return message ?? tr(context,"confirmValidation");
    }
    return null;
  }
}

extension ValidatorDrop<DataType> on DataType {
  String? validateDropDown(BuildContext context,{String? message}) {
    if (this == null) {
      return message ?? "Please fill this field";
    }
    return null;
  }
}
