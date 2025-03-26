import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plate_rotation_animation/Model/food_model.dart' show FoodDetail;
import 'package:plate_rotation_animation/components/Rotation_food_animation.dart';
import 'package:plate_rotation_animation/components/animate_text.dart';
import 'package:plate_rotation_animation/components/animated_tile.dart';
import 'package:plate_rotation_animation/components/food_widget.dart';
import 'package:plate_rotation_animation/utils/const.dart';
import 'package:unicons/unicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Transform(
        transform: Matrix4.identity()..rotateZ(pi / 4),
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff45C37B).withOpacity(0.5),
                offset: const Offset(2, 5),
                blurRadius: 15,
              ),
            ],
          ),
          child: FloatingActionButton(
            mini: true,
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 244, 207, 74),
            onPressed: () {},
            child: Transform(
              transform: Matrix4.identity()..rotateZ(-pi / 4),
              alignment: Alignment.center,
              child: Icon(UniconsLine.arrow_right, color: Colors.black),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: foodList[currentIndex].textColor),
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            itemCount: foodList.length,
            scrollDirection: Axis.vertical,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(color: foodList[index].colorScheme!.background);
            },
          ),
          FoodWidget(
            pageController: _pageController,
            foodDetail: foodList[currentIndex],
          ),
          Positioned(
            top: height / 2 - 222,
            left: width / 2 - 20,
            child: RotationFoodAnimation(
              width: width,
              index: currentIndex,
              pageController: _pageController,
            ),
          ),
        ],
      ),
    );
  }
}
