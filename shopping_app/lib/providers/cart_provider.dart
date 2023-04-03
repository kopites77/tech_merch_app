import 'package:flutter/material.dart';
import '../models/cart_item.dart';

/*******************************************************************************
 * Class name: CartProvider
 * Description: manages the shopping cart items and notifies listeners when 
 *    changes occur. 
 *******************************************************************************/
class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  //getter to return the total number of cart items
  int get itemCount => _items.length;

  //function to add a new item to the cart or update an existing item's quantity
  void addItem({
    required String id,
    required String name,
    required String designPrint,
    required String color,
    required String size,
    required double price,
  }) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          name: existingCartItem.name,
          designPrint: existingCartItem.designPrint,
          color: existingCartItem.color,
          size: existingCartItem.size,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        id,
        () => CartItem(
          id: id,
          name: name,
          designPrint: designPrint,
          color: color,
          size: size,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  //getter for total quantity
  int get totalQuantity {
    int totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity;
    });
    return totalQuantity;
  }

  //getter for minPrice
  double get minPrice {
    double minValue = double.infinity;
    _items.forEach((key, value) {
      if (value.price < minValue) {
        minValue = value.price;
      }
    });
    return minValue;
  }

  //getter to calculate the total cart amount
  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  //function to update the quantity of an existing cart item
  void updateQuantity(String id, int newQuantity) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          name: existingCartItem.name,
          designPrint: existingCartItem.designPrint,
          color: existingCartItem.color,
          size: existingCartItem.size,
          price: existingCartItem.price,
          quantity: newQuantity,
        ),
      );
      notifyListeners();
    }
  }
}
