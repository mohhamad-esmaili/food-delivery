import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/screens/checkout_screen.dart';

import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        primaryColor: Color(0xffD9534F),
      ),
      home: FoodHomeScreen(),
      routes: {
        CheckoutScreen.routeName: (ctx) => CheckoutScreen(),
      },
    );
  }
}
