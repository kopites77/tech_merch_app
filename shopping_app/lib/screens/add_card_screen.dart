/*
SE 330 - Ken Gamradt - Nathan Aamodt, Diana Gonzales, Pradeep Raut, Bailey Wessels
Add Card Screen Page
This page allows users to add the card data to the order for the payment process.
*/
import 'package:flutter/material.dart';
import 'billing_address_screen.dart';

// The widget contains form for the add new card.
class AddNewCardScreen extends StatefulWidget {
  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _saveCardForFutureUse = false;

  // 'build' method to create the UI for the add new card page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // created a basic material design visual layout structure for the add screen form
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // create a formfield that contrain a textfield widget for name
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name on the card',
                ),
                validator: (value) {
                  // validate if the user entered is empty or not
                  if (value == null || value.isEmpty) {
                    return 'Please enter name on the card';
                  }
                  return null;
                },
              ),
              // create a formfield that contrain a textfield widget for card number
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Card Number',
                ),
                validator: (value) {
                  // validate if the user entered is empty or not
                  if (value == null || value.isEmpty) {
                    return 'Please enter card number';
                  } else if (value.length != 16) {
                    return 'Card number must have 16 digits';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      // create a formfield that contrain a textfield widget for epiration date
                      decoration: InputDecoration(
                        labelText: 'Expiration Date',
                      ),
                      validator: (value) {
                        // validate if the user entered is empty or not
                        if (value == null || value.isEmpty) {
                          return 'Please enter expiration date';
                        } else if (!_isValidDate(value)) {
                          return 'Date must not be expired';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    // create a formfield that contrain a textfield widget for cvv
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'CVV',
                      ),
                      validator: (value) {
                        // validate if the user entered is empty or not
                        if (value == null || value.isEmpty) {
                          return 'Please enter CVV';
                        } else if (value.length != 3) {
                          return 'CVV must have 3 digits';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    // checkbox for use if they want to store the card for future use
                    value: _saveCardForFutureUse,
                    onChanged: (value) {
                      setState(() {
                        _saveCardForFutureUse = value!;
                      });
                    },
                  ),
                  Text('Save card for future use'),
                ],
              ),
              Spacer(),
              ElevatedButton(
                // elevated button to navigate to the next page
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BillingAddress()));
                  }
                },
                child: Text('Add Card'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // function that checks if the date entered is expired and uptodate.
  bool _isValidDate(String input) {
    List<String> parts = input.split('/');
    if (parts.length != 2) return false;
    int month = int.tryParse(parts[0]) ?? 0;
    int year = int.tryParse(parts[1]) ?? 0;

    DateTime now = DateTime.now();
    return year > now.year || (year == now.year && month >= now.month);
  }
}
