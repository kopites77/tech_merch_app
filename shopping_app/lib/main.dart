/*
SE 330 - Ken Gamradt - Nathan Aamodt, Diana Gonzales, Pradeep Raut, Bailey Wessels
MyApp
This Page is the main core to the shop it defines the root widget for our application
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'package:shopping_app/providers/cart_provider.dart'; // Make sure to import your CartProvider class

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartProvider>(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: MaterialColor(
            0xFF000000,
            <int, Color>{
              50: Color(0xFFE0E0E0),
              100: Color(0xFFB3B3B3),
              200: Color(0xFF808080),
              300: Color(0xFF4D4D4D),
              400: Color(0xFF262626),
              500: Color(0xFF000000),
              600: Color(0xFF000000),
              700: Color(0xFF000000),
              800: Color(0xFF000000),
              900: Color(0xFF000000),
            },
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(), // Or your initial page
      ),
    );
  }
}
