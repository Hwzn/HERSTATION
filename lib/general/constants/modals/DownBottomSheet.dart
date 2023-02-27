import 'package:flutter/material.dart';
import 'package:hwzn_herstation/general/helper/dio/utils/DioUtils.dart';

import 'ModalHelper.dart';

class DownBottomSheet {
  var data = [];
   Function(String, String) onTab;
  BuildContext context;
  String title;

  DownBottomSheet(
      {required this.data,
        required this.onTab,
        required this.context,
        required this.title});

  void show() {
    return ModalHelper.showModal(
      context: context,
      title: title,
      expand: false,
      content: Container(
        height: 300,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: data.length,
          itemBuilder: (BuildContext con, int position) {
            return InkWell(
              onTap: () =>
                  onTab(data[position].name, data[position].id.toString()),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.grey.withOpacity(.5), width: 1),
                  ),
                ),
                child: Text(
                  data[position].name,
                  style: DioUtils.textStyle.copyWith(fontSize: 12),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
