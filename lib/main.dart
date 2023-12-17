import 'package:flutter/material.dart';
import 'package:needApp/model/cart_model.dart';
import 'package:needApp/pages/intro_screen.dart';
import 'package:needApp/pages/login_page.dart';
import 'package:needApp/pages/profie_page.dart';
import 'package:provider/provider.dart';
// import 'pages/intro_screen.dart';
// import 'pages/login_page.dart';

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
         '/login': (context) => LoginScreen(), // Login ekranınızın rotası
        '/intro': (context) => IntroScreen(), //intro yazicam
        },
      ),
    );
  }
}
