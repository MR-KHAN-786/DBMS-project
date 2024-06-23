import 'package:flutter/material.dart';
import 'package:watch_shopping_app/CartScreen/Cart_screen.dart';
import 'package:watch_shopping_app/HomeScreen/Trending.dart';

class Home_screen1 extends StatefulWidget {
  const Home_screen1({super.key});

  @override
  State<Home_screen1> createState() => _Home_screen1State();
}

class _Home_screen1State extends State<Home_screen1> {
  @override
  Widget build(BuildContext context) {
    int? number = 6;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Cart_Screen()));
                    });
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  )),
              Text(
                "($number)",
                style: TextStyle(fontSize: 25, color: Colors.white),
              )
            ],
            
          ),
          //First Tab Content
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  // textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
                    
                      hintText: "Search  items here",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(width: 0.8)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(width: 0.8,color: Colors.orange)),
                      prefixIcon: IconButton(icon: Icon(Icons.search),onPressed: (){},),
                      fillColor: Colors.white,
                      suffixIcon:
                          IconButton(onPressed: () {}, icon: Icon(Icons.clear))),
                ),
              ),
Trending(),


            ],
          )),
    );
  }
}
