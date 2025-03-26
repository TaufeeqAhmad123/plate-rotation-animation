import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:plate_rotation_animation/utils/const.dart';

class RotationFoodAnimation extends StatefulWidget {
  final double width;
  final int index;
  final PageController pageController;
  const RotationFoodAnimation({
    super.key,
    required this.width,
    required this.index,
    required this.pageController,
  });

  @override
  State<RotationFoodAnimation> createState() => _RotationFoodAnimationState();
}

class _RotationFoodAnimationState extends State<RotationFoodAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double? lastAnimatedValue;
  Curve animationType = Curves.easeOutBack;
   int? textAnimationIndex;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      onVerticalDragUpdate: (details) async {
        if (details.delta.dy <= 0) {
          if (_controller.isAnimating) {
            if (widget.index < foodList.length - 1) {
              setState(() {
                animationType = Curves.easeOutBack;
                textAnimationIndex = widget.index ;
              });
              Future.delayed(const Duration(milliseconds: 500), () {});

              widget.pageController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
              _controller.loop(count: 1, max: 1);
              lastAnimatedValue = 1;
            }
          }
        } else {
          if (!_controller.isAnimating) {
            if (widget.index > 0) {
              setState(() {
                animationType = Curves.easeOutBack;
                textAnimationIndex = widget.index-1 ;
              });
              Future.delayed(const Duration(milliseconds: 500), () {});

              widget.pageController.previousPage(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
              );
              if (widget.index > 0) {
                lastAnimatedValue = 1;
              }
              _controller.reverse(from: lastAnimatedValue);
              lastAnimatedValue = 0;
            }
          }
        }
      },
      child: Hero(
        tag: foodList[widget.index].pictureAlt!,
        flightShuttleBuilder: (
          flightContext,
          animation,
          flightDirextion,
          fromHeroContext,
          toHeroContext,
        ) {
          return Image.asset(
            flightDirextion.name == "push"
                ? "assets/${foodList[widget.index].pictureAlt}"
                : "assets/${foodList[widget.index].picture}",
            width:
                flightDirextion.name == "push"
                    ? widget.width * 0.80
                    : widget.width * 0.88,
          ).animate().rotate(
            begin: flightDirextion.name == 'push' ? 1 : -1,
            end: 0,
            curve:
                flightDirextion.name == 'push'
                    ? Curves.fastOutSlowIn
                    : Curves.fastEaseInToSlowEaseOut,
            duration: const Duration(milliseconds: 600),
          );
        },
        child: Image.asset(
          "assets/${foodList[widget.index].picture}",
          width: widget.width * 0.88,
        ),
      ),
    );
  }
}
