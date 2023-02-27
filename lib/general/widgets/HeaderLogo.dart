import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hwzn_herstation/res.dart';

class HeaderLogo extends StatelessWidget {
  final double? topPadding;

  const HeaderLogo({Key? key, this.topPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: topPadding ?? 0,
        right: 50,
        left: 50,
        bottom: 20,
      ),
      child: SizedBox(
        height: 100,
        width: 100,
        child: Image.asset(
          Res.icon,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
