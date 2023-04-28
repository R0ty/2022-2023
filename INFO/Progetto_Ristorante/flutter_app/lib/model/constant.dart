import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

bool bo = true;

// index per lo state della chiamata al db dalla pagina.dart
int indexState = 0;

Color nero = Color(0);
Color bianco = Color.fromARGB(255, 245, 245, 247);

//SERVER INDIRIZZI

String loophole = 'https://ristorante.loophole.site';
String localhost = 'http://10.0.2.2:4000';
