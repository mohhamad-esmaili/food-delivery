import 'package:flutter/material.dart';

class StarWidget extends StatelessWidget {
  final int rating;
  StarWidget(this.rating);

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (var i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    return Text(
      stars,
      style: TextStyle(fontSize: 15.0),
    );
  }
}
