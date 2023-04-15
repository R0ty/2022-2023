import 'package:flutter/material.dart';

String totalOrder = '';
var orderForResp = '';
const List<String> list = <String>[
  "0",
  "1",
  "2",
  "3",
];
var tavolo;

class Item {
  String name;
  String correzione;

  Item({required this.name, required this.correzione});
}

List<Item> items = [];

// index per lo state della chiamata al db dalla pagina.dart
int indexState = 0;

Color nero = Color(0);
Color bianco = Color.fromARGB(255, 245, 245, 247);
