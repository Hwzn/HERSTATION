import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hwzn_herstation/general/helper/dio/utils/DioUtils.dart';


class CustomModal extends StatelessWidget {
  final Widget content;
  final String title;

  const CustomModal(
      {required this.content, required this.title});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Container(),
          middle: Text(
            title,
            style: DioUtils.textStyle.copyWith(fontSize: 12),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.close,
              size: 25,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: DioUtils.primaryColor,
        ),
        child: SafeArea(
          bottom: false,
          child: content,
        ),
      ),
    );
  }
}
