import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hwzn_herstation/general/constants/MyColors.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final double? size;
  final bool? haveLeading;
  final Function()? fun;

  const DefaultAppBar(
      {Key? key,
      required this.title,
      this.actions = const [],
      this.leading,
      this.size,
      this.fun,
      required this.haveLeading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: haveLeading!
          ? InkWell(
              onTap: fun ?? () => AutoRouter.of(context).pop(),
              child: Icon(
                Icons.arrow_back_ios,
                color: MyColors.primary,
              ),
            )
          : Container(),
      elevation: 0,
      backgroundColor: MyColors.secondary,
      title: Text(title),
      centerTitle: true,
      actions: actions,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      titleTextStyle: GoogleFonts.tajawal(
          color: MyColors.primary,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontSize: 16.0),
      toolbarHeight: 65,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size ?? 65);
}
