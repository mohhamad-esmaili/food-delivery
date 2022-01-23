import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/recent_orders.dart';
import 'package:flutter_food_delivery_ui/widgets/star_widget.dart';

class FoodHomeScreen extends StatelessWidget {
  _buildNearRestaurant() {
    List<Widget> restaurantList = [];
    restaurants.forEach(
      (Restaurant restaurant) {
        restaurantList.add(
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Container(
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image(
                      fit: BoxFit.cover,
                      width: 200.0,
                      height: 150.0,
                      image: AssetImage(restaurant.imageUrl),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurant.name,
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5.0),
                          StarWidget(restaurant.rating),
                          SizedBox(height: 5.0),
                          Text(
                            restaurant.address,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '2 miles away',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    return Column(
      children: restaurantList,
    );
  }

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
              'Cart (${currentUser.cart.length})',
              style: TextStyle(color: Colors.white, fontSize: 17.0),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15.0),
                prefixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    width: 0.8,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                hintText: 'Search Foods or Restaurant',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.clear,
                  ),
                ),
              ),
            ),
          ),
          RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Nearby Restaurant',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
              ),
              _buildNearRestaurant(),
            ],
          ),
        ],
      ),
    );
  }
}
