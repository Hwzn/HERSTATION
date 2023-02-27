import 'package:flutter/material.dart';
import 'package:hwzn_herstation/general/constants/MyColors.dart';
import 'package:hwzn_herstation/general/widgets/MyText.dart';

class AuthHeaderText extends StatelessWidget {
  final String title;
  final bool showBack;

  const AuthHeaderText({required this.title, this.showBack = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: MyText(
        title: title,
        size: 17,
        color: MyColors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
