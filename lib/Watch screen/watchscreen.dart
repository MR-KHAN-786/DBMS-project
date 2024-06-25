import 'package:flutter/material.dart';
import 'package:watch_shopping_app/CartScreen/Cart_screen.dart';

class WatchScreen extends StatefulWidget {
  final String? id;
  final String? pic;
  final String? price;
  final String? description;
  final String? name;

  const WatchScreen({
    super.key,
    this.id,
    this.description,
    this.pic,
    this.price,
    this.name,
  });

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  int number = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(
          Icons.account_circle,
          color: Colors.white,
          size: 30,
        ),
        title: const Text(
          'ASHU    Watch    Store',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Splash',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cart_Screen()),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              "($number)",
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.pic != null)
              Center(
                child: Image.asset(
                  widget.pic!,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 20),
            Text(
              widget.name ?? '',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Splash',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Price: \$",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${widget.price ?? ''}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.description ?? '',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),


            SizedBox(height: 50,),
            TextButton(
                onPressed: () {},
                child: Center(
                  child: Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(color: Colors.white),
                      child: Center(
                        child: Row(children: [
                                            Text("Add to Cart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                                            Icon(Icons.shopping_cart,color: Colors.black,size: 20,)
                                          ]),
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
