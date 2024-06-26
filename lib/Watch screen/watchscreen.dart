import 'package:flutter/material.dart';
import 'package:watch_shopping_app/CartScreen/Cart_screen.dart';

class WatchScreen extends StatefulWidget {
  final String? id;
  final String? pic;
  final int? price; // Change type to int
  final String? description;
  final String? name;
  final Function addToCart;

  const WatchScreen({
    super.key,
    this.id,
    this.description,
    this.pic,
    required this.price, // Required and as an int
    this.name,
    required this.addToCart,
  });

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
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
                MaterialPageRoute(
                  builder: (context) => Cart_Screen(cartItems: []), // Pass the cartItems here
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
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
                const Text(
                  "Price: \$",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${widget.price}', // Display price as integer
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.description ?? '',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                widget.addToCart();
                Navigator.pop(context); // Go back to the previous screen
              },
              child: Center(
                child: Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
