import 'package:flutter/material.dart';
import 'package:watch_shopping_app/HomeScreen/homescreen1.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home:Home_screen1()
    );
  }
}
