/*
SE 330 - Ken Gamradt - Nathan Aamodt, Diana Gonzales, Pradeep Raut, Bailey Wessels
Total Page
This Page shows the cart as well as the applied discounts, shipping, tax  and total of the order
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screens/order_confirmation.dart';
import 'package:shopping_app/providers/cart_provider.dart';

// The widget contains form for the total page
class TotalPage extends StatefulWidget {
  const TotalPage({Key? key}) : super(key: key);

  @override
  _TotalPageState createState() => _TotalPageState();
}

class _TotalPageState extends State<TotalPage> {
  double _discount = 0.0;
  double _tax = 0.0;
  double _shipping = 0.0;
  double _total = 0.0;

  bool _freeShipping = true;
  bool _paidShipping = false;

  // change the state after use picks either radio button for shipping
  @override
  void initState() {
    super.initState();
    _updateTotal();
  }

  // function to update total when the use choose either free or paid shipping
  void _updateTotal() {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    double _subtotal = cartProvider.totalAmount;
    int totalQuantity =
        cartProvider.totalQuantity; // Get the total quantity from CartProvider

    // Apply discount only if totalQuantity > 3
    if (totalQuantity > 3) {
      // Calculate the discount based on the product with the lowest price in the cart
      double minPrice =
          cartProvider.minPrice; // Get the minimum price from CartProvider
      _discount = minPrice;
    } else {
      _discount = 0.0;
    }

    // calcuate the total using checking if the user picked free shipping or paid shipping
    _shipping = _freeShipping ? 0.0 : 5.99;
    _subtotal = _subtotal + _shipping;
    _tax = (4.5 / 100) * _subtotal;
    _total = _subtotal - _discount + _tax;
    setState(() {});
  }

  // 'build' method to create the UI for the total page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Column(
        children: [
          ListTile(
            // radio button for free shipping
            title: const Text('Free Shipping'),
            leading: Radio<bool>(
              value: true,
              groupValue: _freeShipping,
              onChanged: (value) {
                setState(() {
                  // change the value if user picks free shipping
                  _freeShipping = value!;
                  _paidShipping = !value;
                  _updateTotal();
                });
              },
            ),
          ),
          ListTile(
            // radio button for paid shipping
            title: const Text('Paid Shipping - \$5.99'),
            leading: Radio<bool>(
              value: true,
              groupValue: _paidShipping,
              onChanged: (value) {
                setState(() {
                  // change the value if user picks free shipping
                  _paidShipping = value!;
                  _freeShipping = !value;
                  _updateTotal();
                });
              },
            ),
          ),
          const Divider(), // Display user subtotal, discount, tax, shipping and total
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) => ListTile(
              title: const Text('Subtotal'),
              trailing:
                  Text('\$${cartProvider.totalAmount.toStringAsFixed(2)}'),
            ),
          ),
          ListTile(
            title: const Text('Discount'),
            trailing: Text('\$${_discount.toStringAsFixed(2)}'),
          ),
          ListTile(
            title: const Text('Tax'),
            trailing: Text('\$${_tax.toStringAsFixed(2)}'),
          ),
          ListTile(
            title: const Text('Shipping'),
            trailing: Text('\$${_shipping.toStringAsFixed(2)}'),
          ),
          const Divider(),
          ListTile(
            title: const Text('Total'),
            trailing: Text(
              '\$${_total.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            // button use to complete the order
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          OrderConfrimation())); // navigate to order confirmation page
            },
            child: const Text('Complete Order'),
          ),
        ],
      ),
    );
  }
}
