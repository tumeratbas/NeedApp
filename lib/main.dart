import 'package:flutter/material.dart';
import 'package:needapp/model/cart_model.dart';
import 'package:needapp/pages/contact.dart';
import 'package:needapp/pages/home_page.dart';
import 'package:needapp/pages/intro_screen.dart';
import 'package:provider/provider.dart';
import 'package:needapp/pages/login_page.dart';
import 'pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:'/login', // Başlangıç ekranınızın rotası
        routes: {
          '/register': (context) => RegisterPage(),
          '/contact': (context) => ContactPage(),
          '/home': (context) => HomePage(),
         '/login': (context) => LoginScreen(), // Login ekranınızın rotası
        '/intro': (context) => IntroScreen(), //intro yazicam
        },
      ),
    );
  }
}
