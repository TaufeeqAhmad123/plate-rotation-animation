import 'package:flutter/material.dart';
import 'package:plate_rotation_animation/Model/food_model.dart';
import 'package:plate_rotation_animation/foodDetails/detail_screen.dart';
import 'package:unicons/unicons.dart';

List<FoodDetail> foodList = [
  FoodDetail(
    title: "Chilly and garlic lamb",
    colorScheme: const ColorScheme.light(),
    attributes: [
      Attribute(
        icon: const Icon(UniconsLine.bolt, color: Color(0xff45C37B)),
        title: 'Easy',
      ),
      Attribute(
        icon: const Icon(UniconsLine.stopwatch, color: Color(0xff45C37B)),
        title: "25 mins",
      ),
      Attribute(
        icon: const Icon(UniconsLine.heart_medical, color: Color(0xff45C37B)),
        title: "Healthy",
      ),
      Attribute(
        icon: const Icon(UniconsLine.medal, color: Color(0xff45C37B)),
        title: "3+ exp",
      ),
      Attribute(
        icon: const Icon(UniconsLine.crockery, color: Color(0xff45C37B)),
        title: "Non Veg",
      ),
    ],
    textColor: const Color(0xff171f52),
    description:
        'This amazing combination of simple ingredients and spectacular cuts of lamb makes this glazed rack of lamb dish the star of your next dinner party.',
    picture: "Plate-1.png",
    pictureAlt: 'Plate-1-alt.png',
    ingredients: [
      "2 cloves garlic, crushed",
      "2 racks of lamb, frenched and trimmed of fat",
      "2 tbsp olive oil",
      "½ cup AB's Ironbark Honey",
      "2 tsp fresh rosemary, chopped coarsely",
      "2 tsp lemon zest, grated",
      "1 roasted rose",
    ],
    method: "",
  ),
  FoodDetail(
    title: "Roasted Butter Shrimp",
    colorScheme: const ColorScheme.dark(
      background: Color.fromARGB(255, 49, 32, 26),
    ),
    textColor: Colors.white,
    attributes: [
      Attribute(
        icon: const Icon(UniconsLine.bolt, color: Color(0xff45C37B)),
        title: "Medium",
      ),
      Attribute(
        icon: const Icon(UniconsLine.stopwatch, color: Color(0xff45C37B)),
        title: "40 mins",
      ),
      Attribute(
        icon: const Icon(UniconsLine.heart_medical, color: Color(0xff45C37B)),
        title: "Healthy",
      ),
      Attribute(
        icon: const Icon(UniconsLine.medal, color: Color(0xff45C37B)),
        title: "5+ exp",
      ),
      Attribute(
        icon: const Icon(UniconsLine.crockery, color: Color(0xff45C37B)),
        title: "Vegetarian",
      ),
    ],
    description:
        'Be it any occasion, we all love to eat pizza at home. But, what goes behind making this delicious dish? Well, learn all about making a delicious pizza at home with this easy recipe',
    picture: "Plate-3.png",
    pictureAlt: "Plate-3-alt.png",
    ingredients: [
      "2 cloves garlic, crushed",
      "1 tomato",
      "1 cup Mozarella Cheese",
      "2 tbsp olive oil",
      "½ cup AB's Ironbark Honey",
      "2 tsp fresh rosemary, chopped coarsely",
      "2 tsp lemon zest, grated",
      "1 tsp sugar",
    ],
    method: "",
  ),
  FoodDetail(
    title: "Veggie paradise and Extravanza",
    colorScheme: const ColorScheme.light(),
    textColor: const Color(0xff171f52),
    attributes: [
      Attribute(
        icon: const Icon(UniconsLine.bolt, color: Color(0xff45C37B)),
        title: "Medium",
      ),
      Attribute(
        icon: const Icon(UniconsLine.stopwatch, color: Color(0xff45C37B)),
        title: "40 mins",
      ),
      Attribute(
        icon: const Icon(UniconsLine.heart_medical, color: Color(0xff45C37B)),
        title: "Healthy",
      ),
      Attribute(
        icon: const Icon(UniconsLine.medal, color: Color(0xff45C37B)),
        title: "7+ exp",
      ),
      Attribute(
        icon: const Icon(UniconsLine.crockery, color: Color(0xff45C37B)),
        title: "Vegetarian",
      ),
    ],
    description:
        'Be it any occasion, we all love to eat pizza at home. But, what goes behind making this delicious dish? Well, learn all about making a delicious pizza at home with this easy recipe',
    picture: "Plate-2.png",
    pictureAlt: "Plate-2-alt.png",
    ingredients: [
      "2 cloves garlic, crushed",
      "1 tomato",
      "1 cup Mozarella Cheese",
      "2 tbsp olive oil",
      "½ cup AB's Ironbark Honey",
      "2 tsp fresh rosemary, chopped coarsely",
      "2 tsp lemon zest, grated",
      "1 tsp sugar",
    ],
    method: "",
  ),
];

navigateToFoodDetailScreen(FoodDetail food, BuildContext context) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (
        BuildContext context,
        Animation animation,
        Animation secondryAnimation,
      ) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Opacity(
              opacity: animation.value,
              child: FoodDetailScreen(detail: food),
            );
          },
        );
      },
         transitionDuration: const Duration(milliseconds: 800),
      reverseTransitionDuration: const Duration(milliseconds: 500),
    ),
  );
}
