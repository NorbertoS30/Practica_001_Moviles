import 'package:flutter/material.dart';
import 'package:practica_01_fruit_app/src/screens/cart_screen.dart';
import 'package:practica_01_fruit_app/src/screens/fruit_screen.dart';
import 'package:practica_01_fruit_app/src/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/fruit': (BuildContext context) => FruitScreen(),
        '/shopping_cart': (BuildContext context) => CardScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Acme'
      ),
      home: SplashScreen(),
    );
  }
}