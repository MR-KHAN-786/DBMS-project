import 'package:flutter/material.dart';

class Order_Screen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  Order_Screen({required this.cartItems});

  @override
  State<Order_Screen> createState() => _Order_ScreenState();
}

class _Order_ScreenState extends State<Order_Screen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController easypaisaAccountController = TextEditingController();
  TextEditingController creditCardBankController = TextEditingController();
  TextEditingController creditCardAccountController = TextEditingController();

  String paymentMethod = 'Easypaisa'; // Default payment method

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
  void dispose() {
    // Clean up controllers
    nameController.dispose();
    phoneNumberController.dispose();
    cnicController.dispose();
    countryController.dispose();
    provinceController.dispose();
    addressController.dispose();
    easypaisaAccountController.dispose();
    creditCardBankController.dispose();
    creditCardAccountController.dispose();
    super.dispose();
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
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Order Details",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Total Amount to Pay: \$${calculateTotalPrice().toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: cnicController,
              decoration: InputDecoration(
                labelText: 'CNIC',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: countryController,
              decoration: InputDecoration(
                labelText: 'Country',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: provinceController,
              decoration: InputDecoration(
                labelText: 'Province',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: addressController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Full Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Select Payment Method",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: paymentMethod,
              onChanged: (String? newValue) {
                setState(() {
                  paymentMethod = newValue!;
                });
              },
              items: <String>['Easypaisa', 'Credit Card']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            if (paymentMethod == 'Easypaisa') ...[
              TextField(
                controller: easypaisaAccountController,
                decoration: InputDecoration(
                  labelText: 'Easypaisa Account Number',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
            if (paymentMethod == 'Credit Card') ...[
              TextField(
                controller: creditCardBankController,
                decoration: InputDecoration(
                  labelText: 'Credit Card Bank Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: creditCardAccountController,
                decoration: InputDecoration(
                  labelText: 'Credit Card Account Number',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement your order placing logic here
                Navigator.pop(context);
              },
              child:const Text("Place Order"),
            ),
          ],
        ),
      ),
    );
  }
}
