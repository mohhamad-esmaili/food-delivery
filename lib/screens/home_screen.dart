import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';

class FoodHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {},
        ),
        title: AnimatedTextKit(
          repeatForever: true,
          isRepeatingAnimation: true,
          animatedTexts: [
            ColorizeAnimatedText(
              'Food Delivery',
              textStyle: TextStyle(fontSize: 20.0),
              colors: [
                Color(0xff355C7D),
                Color(0xffD9534F),
                Colors.white,
              ],
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Cart${currentUser.cart.length}',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          )
        ],
      ),
    );
  }
}
