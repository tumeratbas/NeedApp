import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final Color color;

  const ProductDetails({
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            height: 300,
            width: 150,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 10),
          Text(
            itemName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text("This is a wonderfull $itemName. You should buy it!!"),
          SizedBox(height: 20),
          Text(
            'Price: $itemPrice',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
