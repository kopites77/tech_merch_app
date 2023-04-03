/*
SE 330 - Ken Gamradt - Nathan Aamodt, Diana Gonzales, Pradeep Raut, Bailey Wessels
Cart Class
This Page defines the Cart and imports the items added to the cart. This page will display the items
as well as add the totals and allow you to proceed to the checkout or back to the home page.
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'checkout_screen.dart';
import 'home.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  //Adds items in Cart and displays it
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/${item.id}-${item.color}-${item.designPrint}.jpg'),
                  ),
                  title: Text(item.name),
                  subtitle:
                      Text('Size: ${item.size}, Design: ${item.designPrint}'),
                  trailing: Row(
                    // Update Quantity
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          int newQuantity = item.quantity - 1;
                          if (newQuantity < 1) newQuantity = 1;
                          cart.updateQuantity(item.id, newQuantity);
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text('${item.quantity}'),
                      IconButton(
                        onPressed: () {
                          cart.updateQuantity(item.id, item.quantity + 1);
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            //Adds total of items and displays price
            padding: EdgeInsets.all(16),
            child: Text(
              'Total: \$${cart.totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ), //Button to go to the Checkout Page
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Checkout()),
              );
            },
            child: Text('Checkout'),
          ),
        ],
      ), // Displays the common app bar spread out in all of our pages
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navigate to the Home page
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false, // removes all previous routes
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // The current page is already the cart, so you don't need to do anything
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Navigate back to the previous page
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
