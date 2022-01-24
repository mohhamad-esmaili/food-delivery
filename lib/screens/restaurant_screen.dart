import 'package:flutter/material.dart';

import 'package:flutter_food_delivery_ui/models/food.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/restaurant_grids.dart';
import 'package:flutter_food_delivery_ui/widgets/star_widget.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantScreen({this.restaurant});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  image: AssetImage(widget.restaurant.imageUrl),
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon:
                            Icon(Icons.arrow_back_ios_new, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25.0,
                horizontal: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.restaurant.name,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('2 miles away')
                    ],
                  ),
                  SizedBox(height: 10.0),
                  StarWidget(widget.restaurant.rating),
                  SizedBox(height: 5.0),
                  Text(
                    widget.restaurant.address,
                  ),
                  SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Reviews',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 40.0,
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Contact',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 40.0,
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Text(
                      'Menu',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: GridView.count(
                      padding: EdgeInsets.all(1.0),
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      physics: BouncingScrollPhysics(),
                      children:
                          List.generate(widget.restaurant.menu.length, (index) {
                        Food food = widget.restaurant.menu[index];
                        return ResturantGridBuilder(food);
                      }),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
