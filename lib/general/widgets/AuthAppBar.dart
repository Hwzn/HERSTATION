import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hwzn_herstation/general/constants/MyColors.dart';
import 'package:hwzn_herstation/general/widgets/MyText.dart';

import '../../res.dart';

class BuildAuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Function()? onBack;
  final bool? isCenterTitle;
  final bool? haveLeading;

  const BuildAuthAppBar({
    Key? key,
    this.title,
    this.onBack,
    this.isCenterTitle,
    this.haveLeading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 40, 15, 0),
      child: AppBar(
        elevation: 0,
        centerTitle: isCenterTitle == true ? true : false,
        title: title != null
            ? Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: MyText(
                  title: title ?? "",
                  color: MyColors.primary,
                  size: 15,
                ),
              )
            : null,
        backgroundColor: Colors.transparent,
        leading: haveLeading == true
            ? InkWell(
                onTap: onBack ?? AutoRouter.of(context).pop,
                child:
                    // Container(
                    //     margin:
                    //         const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.rectangle,
                    //       color: MyColors.primary.withOpacity(.2),
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     child:
                    Image.asset(
                  Res.arrowcircle,
                  height: 10,
                  width: 10,
                  color: Colors.black,
                ),
              )
            : Container(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
