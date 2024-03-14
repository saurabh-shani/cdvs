import 'package:simple_animations/simple_animations.dart';
import 'package:flutter/material.dart';

class FadeInAnimation extends StatelessWidget {
  final double delay;
  final Widget childs;

  FadeInAnimation(this.delay, this.childs);

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      tween: Tween(begin: 50.0, end: 200.0),
      duration: Duration(
        seconds: delay.toInt(),
      ),
      builder: (context, child, value) {
        return childs;
      },
    );
  }
}
