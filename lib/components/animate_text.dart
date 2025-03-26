import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimateText extends StatelessWidget {
  final String data;
  final TextStyle style;
  final bool autoPlay;
  final AnimationController controller;
  const AnimateText({
    super.key,
    required this.data,
    required this.style,
    this.autoPlay = false,
    required this.controller,
  });

  Widget build(BuildContext context) {
    return Text(data, style: style)
        .animate(controller: controller, autoPlay: autoPlay)
        .fade()
        .scaleY(begin: 0, end:1, duration: Duration(milliseconds: 300));
  }
}
