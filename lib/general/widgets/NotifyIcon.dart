import 'package:animations/animations.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwzn_herstation/general/blocks/notify_cubit/notify_cubit.dart';

class NotifyIcon extends StatefulWidget {
  const NotifyIcon({Key? key}) : super(key: key);

  @override
  _NotifyIconState createState() => _NotifyIconState();
}

class _NotifyIconState extends State<NotifyIcon> {
  @override
  Widget build(BuildContext context) {
    var count = context.watch<NotifyCubit>().state.count;
    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      closedColor: Colors.transparent,
      openColor: Colors.white,
      middleColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 100),
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (context, action) => Container(),
      closedBuilder: (context, action) => Container(
        padding: const EdgeInsets.only(right: 5),
        width: 40,
        // child: Badge(
        //   position: BadgePosition.topEnd(top: -3, end: 3),
        //   badgeColor: count <= 0 ? Colors.transparent : Colors.red,
        //   elevation: count <= 0 ? 0 : 3,
        //   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        //   badgeContent: count > 0
        //       ? SizedBox(
        //           child: Text(
        //             '${count > 99 ? "99+" : count}',
        //             style: const TextStyle(fontSize: 9, color: Colors.white),
        //             textAlign: TextAlign.center,
        //           ),
        //         )
        //       : null,
        //   child: const Icon(Icons.notifications),
        // ),
      ),
    );
  }
}
