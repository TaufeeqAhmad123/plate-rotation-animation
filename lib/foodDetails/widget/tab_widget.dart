import 'package:flutter/material.dart';
import 'package:plate_rotation_animation/components/ingredient_widget.dart' ;
import 'package:plate_rotation_animation/components/method.dart';

class TabWidget extends StatefulWidget {
  final List<String> ingredients;
  final Color textColor;
  final AnimationController? controller;
  const TabWidget({
    super.key,
    required this.ingredients,
    required this.textColor,
    this.controller,
  });

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorColor: const Color(0xff45C37B),
          unselectedLabelColor: Colors.grey.withOpacity(0.75),
          labelColor: widget.textColor,
          labelStyle: const TextStyle(fontWeight: FontWeight.w500),
          controller: _tabController,

          tabs: [
            Tab(text: 'Ingredients'),
            Tab(text: 'Methods'),
            
          ],
          
        ),
        Flexible(
          child: TabBarView(
            controller: _tabController,
            children: [
            IngredientWidget(
              ingredients: widget.ingredients,
              controller: widget.controller,
              textColor: widget.textColor,
            ),
            Methods(),
          ]),
        ),
      ],
    );
  }
}

