import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

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
  String tavolo;

  Item({required this.name, required this.correzione, required this.tavolo});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'correzione': correzione,
      'tavolo': tavolo,
    };
  }
}

List<Item> items = [];


//usato per fare l'aggiornamento della pagina una volta sola

bool bo = true;

// index per lo state della chiamata al db dalla pagina.dart
int indexState = 0;

Color nero = Color(0);
Color bianco = Color.fromARGB(255, 245, 245, 247);

//SERVER INDIRIZZI

String loophole = 'https://ristorante.loophole.site';
String localhost = 'http://10.0.2.2:4000';
