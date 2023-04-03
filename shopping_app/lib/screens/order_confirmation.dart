/*
SE 330 - Ken Gamradt - Nathan Aamodt, Diana Gonzales, Pradeep Raut, Bailey Wessels
Order Confirmation Page
This is the final page that tells the customer the order has been confirmed. It has a button to return to the shop as well as providing the customer with the 
Order number.
*/
import 'package:flutter/material.dart';
import 'package:shopping_app/Shop.dart';
import 'dart:math';

// The widget contains form for the order confirmation page
class OrderConfrimation extends StatelessWidget {
  final String _name = 'Customer';
  final int _orderNumber =
      Random().nextInt(999999999); // generate random number for ordernumber
  //const OrderConfrimation({super.key});

// 'build' method to create the UI for the orderconfrimation page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Confirmation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              // ddisplays thank you to the customer with some changes in fontsize and fontweight
              'Thank you, ' + _name + '!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              // displaying icon and text in single line using row class
              children: [
                Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 35,
                ),
                Text(
                  'Your order is confrimed!',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Thank you for shopping with us. Email confirmation is sent. We will send you an email confirmation when your item is shipped. ',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              //display the oder number that was randomly generated
              'Your order number is #$_orderNumber',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // navigate to the shop page once the user has finished purchasing
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Shop()),
                );
              },
              child: Text('Continue Shopping'),
            ),
          ],
        ),
      ),
    );
  }
}
