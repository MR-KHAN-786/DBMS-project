import 'package:flutter/material.dart';
import 'package:watch_shopping_app/CartScreen/Cart_screen.dart';
import 'package:watch_shopping_app/HomeScreen/Trending.dart';
import 'package:watch_shopping_app/HomeScreen/gridview.dart';
import 'package:watch_shopping_app/Watch%20screen/watchscreen.dart';
import 'package:watch_shopping_app/jsonFile/Children.dart';
import 'package:watch_shopping_app/jsonFile/Men.dart';
import 'package:watch_shopping_app/jsonFile/Women.dart';

class Home_screen1 extends StatefulWidget {
  Home_screen1({super.key});

  @override
  State<Home_screen1> createState() => _Home_screen1State();
}

class _Home_screen1State extends State<Home_screen1> {
  int flag = 0;
  List<Map<String, dynamic>> cartItems = [];

  Color menTapColor = Colors.black;
  Color womenTapColor = Colors.white;
  Color childrenTapColor = Colors.white;

  Color menBorderColor = Colors.black;
  Color womenBorderColor = Colors.black;
  Color childrenBorderColor = Colors.black;

  Color menTextColor = Colors.white;
  Color womenTextColor = Colors.black;
  Color childrenTextColor = Colors.black;

  Color favcolor=Colors.white;

  void updateColors(int selected) {
    setState(() {
      if (selected == 1) {
        menTapColor = Colors.black;
        menTextColor = Colors.white;
        menBorderColor = Colors.black;

        womenTapColor = Colors.white;
        womenTextColor = Colors.black;
        womenBorderColor = Colors.black;

        childrenTapColor = Colors.white;
        childrenTextColor = Colors.black;
        childrenBorderColor = Colors.black;
      } else if (selected == 2) {
        womenTapColor = Colors.black;
        womenTextColor = Colors.white;
        womenBorderColor = Colors.black;

        menTapColor = Colors.white;
        menTextColor = Colors.black;
        menBorderColor = Colors.black;

        childrenTapColor = Colors.white;
        childrenTextColor = Colors.black;
        childrenBorderColor = Colors.black;
      } else if (selected == 3) {
        childrenTapColor = Colors.black;
        childrenTextColor = Colors.white;
        childrenBorderColor = Colors.black;

        menTapColor = Colors.white;
        menTextColor = Colors.black;
        menBorderColor = Colors.black;

        womenTapColor = Colors.white;
        womenTextColor = Colors.black;
        womenBorderColor = Colors.black;
      }
    });
  }

  void addToCart(Map<String, dynamic> watch) {
    setState(() {
      cartItems.add(watch);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.account_circle,
          color: Colors.white,
          size: 30,
        ),
        title: Text(
          'ASHU    Watch    Store',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Splash',
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart_Screen(cartItems: cartItems),
                ),
              );
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                hintText: "Search  items here",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 0.8)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 0.8, color: Colors.orange)),
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                fillColor: Colors.white,
                suffixIcon:
                    IconButton(onPressed: () {}, icon: Icon(Icons.clear)),
              ),
            ),
          ),

          //Trending products
          Trending(addToCart: addToCart),
          Row(
            children: [
              SizedBox(width: 10),

              // Category Selection

              GestureDetector(
                onTap: () {
                  updateColors(1);
                  setState(() {
                    flag = 0;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 150,
                  decoration: BoxDecoration(
                    color: menTapColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: menBorderColor, width: 2),
                  ),
                  child: Text(
                    "Men",
                    style: TextStyle(
                        color: menTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  updateColors(2);
                  setState(() {
                    flag = 1;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 150,
                  decoration: BoxDecoration(
                    color: womenTapColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: womenBorderColor, width: 2),
                  ),
                  child: Text(
                    "Women",
                    style: TextStyle(
                        color: womenTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  updateColors(3);
                  setState(() {
                    flag = 2;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 150,
                  decoration: BoxDecoration(
                    color: childrenTapColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: childrenBorderColor, width: 2),
                  ),
                  child: Text(
                    "Children",
                    style: TextStyle(
                        color: childrenTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),

          if (flag == 0)
           BuildWatchList(watches: Men, addToCart: addToCart,)
          else if (flag == 1)
          BuildWatchList(watches:Women, addToCart: addToCart,)
          else
            BuildWatchList(watches:Children, addToCart: addToCart,)
        ],
      ),
    );
  }
}
