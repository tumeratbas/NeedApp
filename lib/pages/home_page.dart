import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:needapp/components/carousel.dart';
import 'package:needapp/components/responsive.dart';
import 'package:needapp/pages/contact.dart';
import 'package:needapp/pages/login_page.dart';
import 'package:needapp/pages/profile_page.dart';
import 'package:provider/provider.dart';
import '../components/grocery_item_tile.dart';
import '../components/product_details.dart';
import '../model/cart_model.dart';
import 'cart_page.dart';
import '/components/category_data.dart';  // Import the category data

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<String> carouselImages = [
    'lib/images/discount1.png',
    'lib/images/discount2.png',
    'lib/images/discount3.png',
  ];

class _HomePageState extends State<HomePage> {

  Screen device = Screen.mobile;

  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return homePage();
      case (Screen.tablet):
        return Row(
          children: [
            Expanded(child: drawerMethod(context)),
            SizedBox(
              width: 600,
              height: double.infinity,
              child: homePage(),
            ),
          ],
        );
      case (Screen.desktop):
        return Row(
          children: [
            SizedBox(
              width: 270,
              height: double.infinity,
              child: drawerMethod(context),
            ),
            SizedBox(
              width: 850,
              height: double.infinity,
              child: homePage(),
            ),
            Expanded(child: CartPage()),
          ],
        );
    }
  }

  drawAppbar() {
    switch (device) {
      case (Screen.mobile):
        return AppBar(
          backgroundColor: Colors.transparent,
        title: Text("Istanbul, Türkiye", style: TextStyle(fontSize: 15, color: Colors.grey),),
        elevation: 0,
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
        );
      case (Screen.tablet):
        return null;
      case (Screen.desktop):
        return null;
    }
  }

  drawDrawer() {
    switch (device) {
      case (Screen.mobile):
        return Drawer(
          child: drawerMethod(context),
        );
      case (Screen.tablet):
        return null;

      case (Screen.desktop):
        return null;
    }
  }
  
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: drawAppbar(),
      drawer: drawDrawer(),
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
      body: drawScreen(),
    );
  }

  SingleChildScrollView homePage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          // good morning sir
          const Padding(
            padding: EdgeInsets.only(bottom: 8, left: 30),
            child: Text("Good Morning,", style: TextStyle(color: Colors.black, fontSize: 15)),
          ),

          const Padding(
            padding: EdgeInsets.only(bottom: 5, left: 30),
            child: Text("Tümer A.👋,", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700)),
          ),

          const SizedBox(
            height: 5,
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 5),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
              },
              decoration: InputDecoration(
                hintText: 'Search for items...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  )
                )
              ),
            ),
          ),

          const SizedBox(height: 10),

          //gallery
          CustomCarousel(images: carouselImages),

          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left:25),
            child: Text(
              "Categories",
              style: TextStyle(
                fontSize:19,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              )
            ),
            ),

            // Categories
          Padding(
            padding: EdgeInsets.only(left: 17),
            child: Container(
              height: 90,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5,),
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle category button press
                          // You can implement logic to filter items based on the selected category
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          backgroundColor: category.color.withOpacity(1),
                          fixedSize: Size(150, 40),
                           shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20), // Köşe yuvarlaklığı
                          ),
                        ),
                        child: Text(
                          category.name,
                          style: TextStyle(color: Colors.white, fontSize: 20,),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

           Padding(
            padding: const EdgeInsets.only(left: 25, top: 10),
            child: Text(
              "Most Popular Items",
              style: GoogleFonts.dosis(
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                  color: Colors. black),
            ),
          ),

          Consumer<CartModel>(
            builder: (context, value, child) {
              return GridView.builder(
                padding: const EdgeInsets.all(12),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: value.shopItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 3.4,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _showProductDetails(
                      context,
                      value.shopItems[index][0], // Item Name
                      value.shopItems[index][1], // Item Price
                      value.shopItems[index][2], // Image Path
                      value.shopItems[index][3], // Color
                    ),
                    child: GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () => Provider.of<CartModel>(context, listen: false).addItemToCart(index),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Drawer drawerMethod(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green.shade700,
            ),
            child: Text(
              'Need',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
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
          ListTile(
            title: Text('Contact'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
    void _showProductDetails(
    BuildContext context,
    String itemName,
    String itemPrice,
    String imagePath,
    Color color,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ProductDetails(
          itemName: itemName,
          itemPrice: itemPrice,
          imagePath: imagePath,
          color: color,
        );
      },
    );
  }