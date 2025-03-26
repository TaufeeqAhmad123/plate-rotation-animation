import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class IngredientWidget extends StatelessWidget {
  final List<String> ingredients;
  final AnimationController? controller;
  final Color textColor;
  const IngredientWidget({
    super.key,
    required this.ingredients,
    this.controller,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return CheckboxListTile.adaptive(
              value: false,
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              onChanged: (val) {},
              title: Text(
                ingredients[index],
                style: TextStyle(color: textColor),
              ),
            )
            .animate(controller: controller!)
            .then(delay: Duration(milliseconds: 300 + index * 50))
            .slideY(
              begin: 1.4,
              end: 0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
            );
      },
      itemCount: ingredients.length,
    );
  }
}
