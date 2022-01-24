import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/food.dart';

class ResturantGridBuilder extends StatelessWidget {
  final Food food;

  ResturantGridBuilder(this.food);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [Image(image: AssetImage(food.imageUrl))],
      ),
    );
  }
}
