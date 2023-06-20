import 'package:flutter/material.dart';
import 'package:hwzn_herstation/general/constants/MyColors.dart';
import 'package:hwzn_herstation/general/widgets/MyText.dart';


class BuildHeaderTitle extends StatelessWidget {
  final String title;

  const BuildHeaderTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top:25,bottom: 15),
      child: MyText(
        title: title,
        color: MyColors.black,
        size: 17,
        alien: TextAlign.center,
      ),
    );
  }
}
