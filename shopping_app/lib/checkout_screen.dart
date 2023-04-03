/*
SE 330 - Ken Gamradt - Nathan Aamodt, Diana Gonzales, Pradeep Raut, Bailey Wessels
Checkout Class
This Page defines the Checkout screen.
*/
import 'package:flutter/material.dart';
import './screens/shipping_address_screen.dart';

// The widget contains the shipping address form widget with appbar widget. navigated from the cart screen
class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  // 'build' method to create the UI for the Shippingaddress screen page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // created a basic material design visual layout structure for the checkout screen
      appBar: AppBar(
        // displays appbar
        title: const Text('Checkout'),
      ),
      body: ShippingAddressForm(), // shippingaddress form widget
    );
  }
}
