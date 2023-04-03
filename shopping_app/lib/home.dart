/*
SE 330 - Ken Gamradt - Nathan Aamodt, Diana Gonzales, Pradeep Raut, Bailey Wessels
Home Class
This is the home page allowing acess to the rest of the shop and has our team logo.
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/models/cart_item.dart';
import 'cart.dart';
import 'Shop.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.jpg'), // The logo image
            SizedBox(
                height: 20), // Add some space between the logo and the text
            Text(
              'Welcome!', // The "Welcome!" sign
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
                height:
                    20), // Add some space between the "Welcome!" sign and the next text
            Text('Tech Clothing Merch'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Shop()),
                );
              },
              child: Text('Shop'),
            ),
          ],
        ),
      ),
    );
  }
}
