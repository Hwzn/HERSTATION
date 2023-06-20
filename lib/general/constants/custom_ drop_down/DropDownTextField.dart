import 'package:flutter/material.dart';
import 'package:hwzn_herstation/general/constants/MyColors.dart';

import '../../helper/dio/utils/DioUtils.dart';
import '../../widgets/MyText.dart';
import 'CustomDropDown.dart';

class DropdownTextField<DataType> extends StatefulWidget {
  final dynamic data;
  final GlobalKey? dropKey;
  final String? label;
  final String? hint;
  final String? searchHint;
  final DataType? selectedItem;
  final bool showSelectedItem;
  final EdgeInsets? margin;
  final double? fontSize;
  final double? labelSize;
  final double? textSize;
  final String? Function(dynamic) validate;
  final dynamic onChange;
  final dynamic finData;
  final EdgeInsets? arrowBtnPadding;
  final EdgeInsets? clearBtnPadding;
  final EdgeInsets? contentPadding;
  final bool useName;
  final Color? enableColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? buttonsColor;
  final BorderRadius? radius;

  DropdownTextField(
      {this.label,
      this.hint,
      this.margin,
      required this.validate,
      this.contentPadding,
      this.clearBtnPadding,
      this.arrowBtnPadding,
      this.useName = true,
      this.searchHint,
      this.onChange,
      this.fontSize,
      this.textSize,
      this.labelSize,
      this.hintColor,
      this.fillColor,
      this.buttonsColor,
      this.finData,
      this.dropKey,
      this.data,
      this.enableColor,
      this.selectedItem,
      this.radius,
      this.showSelectedItem = false});

  @override
  _DropdownTextFieldState<DataType> createState() =>
      _DropdownTextFieldState<DataType>();
}

class _DropdownTextFieldState<DataType> extends State<DropdownTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? EdgeInsets.zero,
      child: DropdownSearch<DataType>(
        key: widget.dropKey,
        mode: Mode.BOTTOM_SHEET,
        isFilteredOnline: false,
        maxHeight: 350,
        label: widget.label,
        items: widget.data,
        onFind: widget.finData,
        validator: widget.validate,
        onChanged: widget.onChange,
        showSearchBox: true,
        showClearButton: true,
        clearButton: Padding(
          padding: widget.clearBtnPadding ??
              const EdgeInsets.symmetric(horizontal: 5),
          child: Icon(Icons.clear,
              size: 20, color: widget.buttonsColor ?? Colors.black),
        ),
        dropDownButton: Padding(
          padding: widget.arrowBtnPadding ??
              const EdgeInsets.symmetric(horizontal: 5),
          child: Icon(Icons.arrow_drop_down,
              size: 24, color: widget.buttonsColor ?? Colors.black),
        ),
        selectedItem: widget.selectedItem,
        itemAsString: (dynamic u) => widget.useName ? u.name : u,
        showSelectedItem: widget.showSelectedItem,
        style: DioUtils.textStyle.copyWith(
          fontSize: widget.textSize ?? DioUtils.textStyle.fontSize,
        ),
        searchBoxStyle: DioUtils.textStyle,
        searchBoxDecoration: DioUtils.setInputDecoration(
          hint: widget.searchHint ?? "بحث",
          enableColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
        popupTitle: Container(
          height: 50,
          decoration: BoxDecoration(
            color: MyColors.primary,
          ),
          child: Center(
            child: MyText(
              title: widget.label != null ? widget.label??"" : widget.hint??"",
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
        dropdownSearchDecoration: DioUtils.setInputDecoration(
          hintColor: widget.hintColor,
          label: widget.label,
          hint: widget.hint,
          fillColor: widget.fillColor,
          enableColor: widget.enableColor,
          radius: widget.radius,
          padding: widget.contentPadding ??
              const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        ),
      ),
    );
  }
}
