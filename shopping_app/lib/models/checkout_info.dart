import 'package:flutter/material.dart';

/*
SE 330 - Ken Gamradt - Nathan Aamodt, Diana Gonzales, Pradeep Raut, Bailey Wessels
CheckoutInfo Class
This class allows info for the customers order is stored in the app and allows
the checkout to have all the proper information needed.
*/

/*******************************************************************************
 * Class name: CheckoutInof
 * Description: store checkout information regarding name, address, card information and billing information
 * with shipping and discount
 ********************************************************************************/
//Store CheckoutInfo information
class CheckoutInfo {
  late String name;
  late String address1;
  late String address2;
  late String city;
  late String state;
  late String zipCode;
  bool isSameShippingAddress;
  bool defaultaddress;
  late String cardName;
  late String cardNumber;
  late String cardExpirationDate;
  late String cvv;
  late String billingname;
  late String billingaddress1;
  late String billingaddress2;
  late String billingcity;
  late String billingstate;
  late String billingzipCode;

  CheckoutInfo(
    this.name,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.zipCode,
    this.isSameShippingAddress,
    this.defaultaddress,
    this.cardName,
    this.cardNumber,
    this.cardExpirationDate,
    this.cvv,
  );
}
