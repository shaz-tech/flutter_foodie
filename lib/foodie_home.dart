import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_app/foodie_details.dart';
import 'package:flutter_practice_app/model/Food.dart';

class FoodieHome extends StatefulWidget {
  @override
  _FoodieHomeState createState() => _FoodieHomeState();
}

class _FoodieHomeState extends State<FoodieHome> {
  Size _mediaQuerySize;
  int _cartCounter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Container(
                  width: 120.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 32.0),
            child: RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                    ),
                    children: [
                  TextSpan(
                    text: 'Foodie',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0.5, 0.5),
                          blurRadius: 0.5,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  TextSpan(
                    text: ' Bazar',
                    style: TextStyle(
                      color: Colors.white.withAlpha(200),
                    ),
                  ),
                ])),
          ),
          SizedBox(
            height: 40.0,
          ),
          SizedBox(
            height: _mediaQuerySize.height - 182.0,
            width: _mediaQuerySize.width,
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: 'card',
                  child: SizedBox(
                    height: _mediaQuerySize.height - 182.0,
                    width: _mediaQuerySize.width,
                    child: Card(
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(72.0)),
                      ),
                      elevation: 4,
                    ),
                  ),
                ),
                Container(
                  child: ListView(
                    primary: false,
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 24.0),
                        child: Container(
                          height: _mediaQuerySize.height - 280.0,
                          child: ListView(
                            children: <Widget>[
                              _buildFoodItem(Food('Sea Food',
                                  'assets/images/img1.png', 320.toDouble())),
                              _buildFoodItem(Food('Biryani',
                                  'assets/images/img2.png', 340.00.toDouble())),
                              _buildFoodItem(Food('Whopper Chicken Burger',
                                  'assets/images/img3.png', 260.00.toDouble())),
                              _buildFoodItem(Food('Mutton Burger',
                                  'assets/images/img4.png', 240.00.toDouble())),
                              _buildFoodItem(Food('Salad',
                                  'assets/images/img5.png', 99.00.toDouble())),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              height: 48.0,
                              width: 48.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.search),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              height: 48.0,
                              width: 48.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.shopping_basket),
                                    onPressed: () {},
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 2.0,
                                        right: 4.0,
                                      ),
                                      child: Text(
                                        '$_cartCounter',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 48.0,
                              width: 120.0,
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Checkout',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(Food food) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FoodieDetails(food.image, food),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: food.image,
                    child: Image(
                      image: AssetImage(food.image),
                      fit: BoxFit.scaleDown,
                      height: 72.0,
                      width: 72.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        food.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\₹ " + food.price.toString(),
                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.black,
              onPressed: () {
                setState(() {
                  _cartCounter++;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
