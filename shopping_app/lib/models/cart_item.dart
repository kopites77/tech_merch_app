import 'package:flutter/material.dart';

/*
SE 330 - Ken Gamradt - Nathan Aamodt, Diana Gonzales, Pradeep Raut, Bailey Wessels
CartItem Class
This Class creates a way to push the items to the cart and allow for the app to recognize 
what items are being purchased.
*/
/*******************************************************************************
 * Class name: CartItem
 * Description: store product information, id, name, designprint, color, size, price. 
 ********************************************************************************/
//Store CartItem information
class CartItem {
  final String id;
  final String name;
  final String designPrint;
  final String color;
  final String size;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.designPrint,
    required this.color,
    required this.size,
    required this.price,
    required this.quantity,
  });
}
