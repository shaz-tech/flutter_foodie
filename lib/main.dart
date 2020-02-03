import 'package:flutter/material.dart';
import 'package:flutter_practice_app/foodie_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie Bazar',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: FoodieHome(),
    );
  }
}
