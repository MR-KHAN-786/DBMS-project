import 'package:flutter/material.dart';
import 'package:watch_shopping_app/Watch%20screen/watchscreen.dart';

class BuildWatchList extends StatefulWidget {
  final List<Map<String, dynamic>> watches;
  final Function(Map<String, dynamic>) addToCart;

  BuildWatchList({required this.watches, required this.addToCart});

  @override
  State<BuildWatchList> createState() => _BuildWatchListState();
}

class _BuildWatchListState extends State<BuildWatchList> {
  Map<int, bool> favoriteMap = {};

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.watches.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        final watch = widget.watches[index];

        int price = int.tryParse(watch["product_price"].toString()) ?? 0;
        bool isFavorite =
            favoriteMap.containsKey(index) ? favoriteMap[index]! : false;
        Color favColor = isFavorite ? Colors.red : Colors.grey;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WatchScreen(
                  id: watch["product_id"].toString(),
                  pic: watch["product_pic"].toString(),
                  price: price,
                  description: watch["product_description"].toString(),
                  name: watch["product_Name"].toString(),
                  addToCart: () => widget.addToCart(watch),
                ),
              ),
            );
          },
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    watch["product_pic"],
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        watch["product_Name"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(watch["product_description"]),
                      SizedBox(height: 4.0),
                      Text(
                        "\$${watch["product_price"]}",
                        style: TextStyle(color: Colors.green),
                      ),
                      SizedBox(height: 8.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(Icons.favorite, color: favColor),
                          onPressed: () {
                            setState(() {
                              // Toggle favorite status
                              if (favoriteMap.containsKey(index)) {
                                favoriteMap.remove(index);
                              } else {
                                favoriteMap[index] = true;
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
