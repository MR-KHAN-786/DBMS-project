import 'package:flutter/material.dart';
import 'package:watch_shopping_app/CartScreen/Cart_screen.dart';
import 'package:watch_shopping_app/HomeScreen/Trending.dart';
import 'package:watch_shopping_app/jsonFile/Children.dart';
import 'package:watch_shopping_app/jsonFile/Men.dart';
import 'package:watch_shopping_app/jsonFile/Women.dart';

class Home_screen1 extends StatefulWidget {
  Home_screen1({super.key});

  @override
  State<Home_screen1> createState() => _Home_screen1State();
}

class _Home_screen1State extends State<Home_screen1> {
int flag=0;

  Color menTapColor = Colors.black;
  Color womenTapColor = Colors.white;
  Color childrenTapColor = Colors.white;

  Color menBorderColor = Colors.black;
  Color womenBorderColor = Colors.black;
  Color childrenBorderColor = Colors.black;

  Color menTextColor = Colors.white;
  Color womenTextColor = Colors.black;
  Color childrenTextColor = Colors.black;

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
                    MaterialPageRoute(builder: (context) => Cart_Screen()),
                  );
                });
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            Text(
              "($number)",
              style: TextStyle(fontSize: 25, color: Colors.white),
            )
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
            Trending(),
            Row(
              children: [
                SizedBox(width: 10),
                
//for the Category Selection

                GestureDetector(
                  onTap: () {
                    updateColors(1);
                    flag=0;
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
                    updateColors(2);   flag=1;
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
                    updateColors(3);   flag=2;
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

if(flag==0)
 buildWatchList(Men)
else if(flag==1)
 buildWatchList(Women)
else
   buildWatchList(Children)


          ],
        ),
      ),
    );
  }
}



 Widget buildWatchList(List<Map<String, dynamic>> watches) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: watches.length,
      itemBuilder: (context, index) {
        final watch = watches[index];
        return ListTile(
          leading: Image.network(watch["product_pic"]),
          title: Text(watch["product_Name"]),
          subtitle: Text(watch["product_description"]),
          trailing: Text("\$${watch["product_price"]}"),
        );
      },
    );
  }








