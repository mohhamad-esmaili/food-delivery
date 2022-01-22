import 'package:flutter/material.dart';

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
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        primaryColor: Color(0xffDD4A48),
      ),
      home: FoodHomeScreen(),
    );
  }
}
