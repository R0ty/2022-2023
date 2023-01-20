import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/main.dart';

//TODO
class Order {
  final String ordine;
  final int tavolo;


  const Order({
    required this.ordine,
    required this.tavolo,

  });

  static Order fromJson(json) =>
      Order(ordine: json['ordine'], tavolo: json['tavolo']);
}
