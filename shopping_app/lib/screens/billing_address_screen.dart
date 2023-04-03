/*
SE 330 - Ken Gamradt - Nathan Aamodt, Diana Gonzales, Pradeep Raut, Bailey Wessels
Billing Address Page
This page allows the customer to set a billing address if they want it to be
differnt from the shipping address.
*/import 'package:flutter/material.dart';
import 'package:shopping_app/screens/total_screen.dart';
import '../screens/billing_address_form.dart';

enum Auth {
  sameaddress,
  notsameaddress,
}

class BillingAddress extends StatefulWidget {
  const BillingAddress({super.key});

  @override
  State<BillingAddress> createState() => _BillingAddressState();
}

class _BillingAddressState extends State<BillingAddress> {
  final _formKey = GlobalKey<FormState>();
  Auth _auth = Auth.notsameaddress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: const Text(
                  'Same as Shipping address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: Color.fromRGBO(207, 229, 8, 0.965),
                  value: Auth.sameaddress,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text(
                  'Different billing address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: Color.fromRGBO(207, 229, 8, 0.96),
                  value: Auth.notsameaddress,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.notsameaddress)
                BillingAddressForm()
              else
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TotalPage(),
                      ),
                    );
                  },
                  child: Text('Next'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
