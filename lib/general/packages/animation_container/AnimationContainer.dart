import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationContainer extends StatelessWidget {
  final Widget child;
  final int index;
  final bool vertical;
  final bool scale;
  final double distance;
  final Duration? duration;

  const AnimationContainer(
      {Key? key,
      required this.child,
      required this.index,
      this.vertical = true,
      this.distance = 100,
      this.scale = false,
      required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: duration ?? const Duration(milliseconds: 300),
      child: Visibility(
        visible: scale,
        replacement: Visibility(
          visible: vertical,
          replacement: SlideAnimation(
            horizontalOffset: distance,
            child: FadeInAnimation(child: child),
          ),
          child: SlideAnimation(
            verticalOffset: distance,
            child: FadeInAnimation(child: child),
          ),
        ),
        child: ScaleAnimation(
          child: FadeInAnimation(child: child),
        )
      )
    );
  }
}
