/*
SE 330 - Ken Gamradt - Nathan Aamodt, Diana Gonzales, Pradeep Raut, Bailey Wessels
Billing Address Form Page
This page is a form to fill out for the billing address for the order,
allows the billing address and shipping address to be differnt.
*/
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/add_card_screen.dart';
import 'package:shopping_app/screens/total_screen.dart';
import '../models/checkout_info.dart';

class BillingAddressForm extends StatefulWidget {
  @override
  _BillingAddressFormState createState() => _BillingAddressFormState();
}

class _BillingAddressFormState extends State<BillingAddressForm> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _addressLine1;
  late String _addressLine2;
  late String _city;
  late String _state;
  late String _zipCode;
  late bool _defaultaddress = true;

  // 'build' method to create the UI for the billing address page
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // create a single widget that can be scrolled
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                // create a formfield that contrain a textfield widget for name
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  // validate if the user entered is empty or not
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                // create a formfield that contrain a textfield widget for address
                decoration: InputDecoration(
                  labelText: 'Address Line 1',
                ),
                validator: (value) {
                  // validate if the user entered is empty or not
                  if (value == null || value.isEmpty) {
                    return 'Please enter an address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _addressLine1 = value as String;
                },
              ),
              TextFormField(
                // create a formfield that contrain a textfield widget for address 2
                decoration: InputDecoration(
                  labelText: 'Address Line 2',
                ),
                onSaved: (value) {
                  _addressLine2 = value as String;
                },
              ),
              TextFormField(
                // create a formfield that contrain a textfield widget for city
                decoration: InputDecoration(
                  labelText: 'City',
                ),
                validator: (value) {
                  // validate if the user entered is empty or not
                  if (value == null || value.isEmpty) {
                    return 'Please enter a city';
                  }
                  return null;
                },
                onSaved: (value) {
                  _city = value as String;
                },
              ),
              TextFormField(
                // create a formfield that contrain a textfield widget for state
                decoration: InputDecoration(
                  labelText: 'State',
                ),
                validator: (value) {
                  // validate if the user entered is empty or not
                  if (value == null || value.isEmpty) {
                    return 'Please enter a state';
                  }
                  return null;
                },
                onSaved: (value) {
                  _state = value as String;
                },
              ),
              TextFormField(
                // create a formfield that contrain a textfield widget for zip code
                decoration: InputDecoration(
                  labelText: 'ZIP Code',
                ),
                validator: (value) {
                  // validate if the user entered is empty or not
                  if (value == null || value.isEmpty) {
                    return 'Please enter a ZIP code';
                  }
                  return null;
                },
                onSaved: (value) {
                  _zipCode = value as String;
                },
              ),
              Row(
                children: [
                  Checkbox(
                    // checkbox to save user input if they want to make it defualt address
                    value: _defaultaddress,
                    onChanged: (value) {
                      setState(() {
                        _defaultaddress = value!;
                      });
                    },
                  ),
                  Text('Use as default address'),
                ],
              ),
              ElevatedButton(
                // button used for navigation to go to totalpage widget
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TotalPage())); // push the totalpage in the stack
                  }
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
