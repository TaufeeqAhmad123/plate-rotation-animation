import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plate_rotation_animation/Model/food_model.dart';
import 'package:plate_rotation_animation/components/animate_text.dart';
import 'package:plate_rotation_animation/components/animated_tile.dart';

class FoodWidget extends StatefulWidget {
  final FoodDetail foodDetail;
  const FoodWidget({
    super.key,
    required PageController pageController,
    required this.foodDetail,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  State<FoodWidget> createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      lowerBound: 0,
      upperBound: 1,
    );

    super.initState();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: AnimateText(
                data: "DAILY COOKING QWEST",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                controller: _controller,
                autoPlay: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Hero(
                tag: widget.foodDetail.title!,
                child: AnimateText(
                  data: widget.foodDetail.title!,
                  style: GoogleFonts.ibmPlexSerif().copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  
                  ),
                  controller: _controller,
                
                ),
              ),
            ),
            const SizedBox(height: 50),
            ...widget.foodDetail.attributes!.map(
              (data) => AnimatedTile(data: data, controller: _controller),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .13),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: AnimateText(
                    data: widget.foodDetail.description!,
                    style: TextStyle(
                      fontSize: 18,
                      color: widget.foodDetail.textColor,
                    ),
                    controller: _controller,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
