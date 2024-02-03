import 'dart:ui';
import 'package:flutter/material.dart';

// category_data.dart
class Category {
  final String name;
  final Color color;
  final String imagePath;
  final IconData icon;

  Category({required this.name, required this.color, required this.imagePath, required this.icon});
}

List<Category> categories = [
  Category(name: 'Fruit', color: Colors.green, imagePath: 'assets/fruits.jpg', icon: Icons.local_florist),
  Category(name: 'Vegetable', color: Colors.orange, imagePath: 'assets/vegetables.jpg', icon: Icons.local_florist),
  Category(name: 'Snack', color: Colors.blue, imagePath: 'assets/snacks.jpg', icon: Icons.fastfood),
  Category(name: 'Beverage', color: Colors.purple, imagePath: 'assets/beverages.jpg', icon: Icons.local_cafe),
  Category(name: 'Hygiene', color: Colors.red, imagePath: 'assets/personal_care.jpg', icon: Icons.spa),
  Category(name: 'Baby', color: Colors.yellow, imagePath: 'assets/baby.jpg', icon: Icons.child_care),
];

