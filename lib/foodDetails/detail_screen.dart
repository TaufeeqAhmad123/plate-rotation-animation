import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plate_rotation_animation/Model/food_model.dart';
import 'package:plate_rotation_animation/components/animated_tile.dart';
import 'package:plate_rotation_animation/foodDetails/widget/tab_widget.dart';
import 'package:unicons/unicons.dart';

class FoodDetailScreen extends StatefulWidget {
  final FoodDetail detail;
  const FoodDetailScreen({super.key, required this.detail});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.detail.colorScheme!.background,
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,

        leading: IconButton(
          onPressed: () {
            _controller.reverse();
            Future.delayed(const Duration(milliseconds: 600), () {
              Navigator.pop(context);
            });
          },
          icon: Icon(UniconsLine.arrow_left, color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: Hero(
                  tag: widget.detail.pictureAlt!,
                  child: Image.asset(
                    'assets/${widget.detail.pictureAlt}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Hero(
                tag: widget.detail.title!,
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    widget.detail.title!,
                    style: GoogleFonts.ibmPlexSerif().copyWith(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      color: widget.detail.textColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: AnimatedTile(
                    data: widget.detail.attributes![1],
                    animation: false,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: AnimatedTile(
                    data: widget.detail.attributes![3],
                    animation: false,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabWidget(
                controller: _controller,
                ingredients: widget.detail.ingredients ?? [],
                textColor: widget.detail.textColor!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
