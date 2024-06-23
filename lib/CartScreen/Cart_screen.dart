import 'package:flutter/material.dart';
import 'package:watch_shopping_app/HomeScreen/homescreen1.dart';

class Cart_Screen extends StatefulWidget {
  const Cart_Screen({super.key});

  @override
  State<Cart_Screen> createState() => _Cart_ScreenState();
}

class _Cart_ScreenState extends State<Cart_Screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
Navigator.pop(context, MaterialPageRoute(builder: (context)=>Home_screen1()));

              });
            },
          ),
          title: Text(
            "Cart   Screen",
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'Splash',
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("This is the Cart Screen")],
        )),
      ),
    );
  }
}
