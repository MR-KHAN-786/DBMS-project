import 'package:flutter/material.dart';
import 'package:watch_shopping_app/HomeScreen/home_screen.dart';

void main() {
  runApp(const MyWatchapp());
}

class MyWatchapp extends StatelessWidget {
  const MyWatchapp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Splashscreen(),
      home: Home_screen(),
      
      );
  }
  
  }