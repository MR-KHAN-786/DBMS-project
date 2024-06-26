import 'package:flutter/material.dart';
import 'package:watch_shopping_app/HomeScreen/orderscreen.dart';

class Cart_Screen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  Cart_Screen({required this.cartItems});

  @override
  State<Cart_Screen> createState() => _Cart_ScreenState();
}

class _Cart_ScreenState extends State<Cart_Screen> {
  void removeFromCart(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
    });
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var item in widget.cartItems) {
      if (item["product_price"] is num) {
        totalPrice += item["product_price"];
      }
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Cart Screen",
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Splash',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: widget.cartItems.isEmpty
                ? Center(
                    child: Text(
                      "No Orders yet",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return ListTile(
                        leading: Image.asset(
                          item["product_pic"],
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                        title: Text(item["product_Name"]),
                        subtitle: Text(item["product_description"]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("\$${item["product_price"]}"),
                            IconButton(
                              icon: Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                removeFromCart(index);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Price: \$${calculateTotalPrice().toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (widget.cartItems.isEmpty) {
                      // Show alert if cart is empty
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Cart is Empty"),
                            content: Text("No items in the cart. Add items to the cart first."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      // Navigate to Order_Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Order_Screen(),
                        ),
                      );
                    }
                  },
                  child: Text("Order Now"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
