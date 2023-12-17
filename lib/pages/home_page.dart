import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needApp/pages/login_page.dart';
import 'package:needApp/pages/profile_page.dart';
import 'package:provider/provider.dart';
import '../components/grocery_item_tile.dart';
import '../model/cart_model.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(135, 50, 15, 153),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Istanbul, Türkiye',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) {
                return ProfilePage();
      },
    ),
  );
},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(135, 50, 15, 153),
              ),
              child: Text(
                'NeedApp',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('My Cart'),
              onTap: () {
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const CartPage()),
  );
              },
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: () {
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoginScreen()),
  );
              },
            ),
            // Add more ListTile widgets for additional drawer items
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white54,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),
        child: const Icon(Icons.shopping_bag),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),

            // good morning sir
            const Padding(
              padding: EdgeInsets.only(bottom: 10, left: 30),
              child: Text("Good morning,", style: TextStyle(color: Colors.white)),
            ),

            const SizedBox(
              height: 4,
            ),

            // Let's order fresh items for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 128, 122, 234),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Let's order fresh items for you",
                    style: GoogleFonts.dosis(
                        fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),

            const SizedBox(
              height: 24,
            ),

            // categories -> horizontal listview
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Fresh Items",
                style: GoogleFonts.dosis(
                    //fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),

            // recent orders -> show last 3
            Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () => Provider.of<CartModel>(context, listen: false)
                          .addItemToCart(index),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
