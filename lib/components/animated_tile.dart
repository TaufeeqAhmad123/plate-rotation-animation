import 'package:flutter/material.dart';
import 'package:plate_rotation_animation/Model/food_model.dart';
import 'package:plate_rotation_animation/components/animate_text.dart';

class AnimatedTile extends StatelessWidget {
  final Attribute data;
  final AnimationController? controller;
  final bool animation;
  const AnimatedTile({
    super.key,
    required this.data,
    this.controller,
    this.animation = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        leading: Hero(tag: data.icon, child: data.icon),
        title: Hero(
          tag: data.title,
          child: Material(
            type: MaterialType.transparency,
            child:
                animation
                    ? AnimateText(
                      data: data.title,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                      controller: controller!,
                    )
                    : Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}
