/*
SE 330 - Ken Gamradt - Nathan Aamodt, Diana Gonzales, Pradeep Raut, Bailey Wessels
Shipping Address Form
This page allows the customer to add their shipping address to the order.
*/
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/add_card_screen.dart';

// this widget contains shipping address form the ask user for their address
class ShippingAddressForm extends StatefulWidget {
  @override
  _ShippingAddressFormState createState() => _ShippingAddressFormState();
}

// Defines variables for order address
class _ShippingAddressFormState extends State<ShippingAddressForm> {
  final _formKey = GlobalKey<FormState>();

  // tempeorary variables to store the data
  late String _name;
  late String _addressLine1;
  late String _addressLine2;
  late String _city;
  late String _state;
  late String _zipCode;
  late bool _defaultaddress = true;

  // 'build' method to create the UI for the shipping page
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
                // create a formfield that contrain a textfield widget for address line 1
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
                // create a formfield that contrain a textfield widget for address line 2
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
                // create a formfield that contrain a textfield widget for zipcode
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
                    // create a checkbox buttom widget for default address
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
                // elevated button is created to navigate to the add new card screen
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddNewCardScreen()));
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
