import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../screens/tavolo.dart';

const List<String> list = <String>[
  "0",
  "1",
  "2",
  "3",
];
var tavolo;

class Item {
  String piatto;
  String correzione;
  String tavolo;

  Item({required this.piatto, required this.correzione, required this.tavolo});

  Map<String, dynamic> toJson() {
    return {
      'piatto': piatto,
      'correzione': correzione,
      'tavolo': tavolo,
    };
  }
}

List<Item> items = [];

//INVIO PIATTI

Future<void> postRequest(var context) async {
  try {
    var url = Uri.parse('$localhost/ordinazioni');
    var headers = {'Content-Type': 'application/json'};
    var foodJson = items.map((e) {
      return {
        "piatto": e.piatto,
        "correzione": e.correzione,
        "tavolo": e.tavolo
      };
    }).toList(); //convert to map
    String body = json.encode(foodJson);
    print(body);
    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      //DIALOG DOPO AVER INVIATO L 'ORDINE
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('Ordine ricevuto'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Tavolo(),
                  )),
                ),
              ],
            );
          });
    }
  } catch (error) {
    print('error');
    throw error;
  }
}

//usato per fare l'aggiornamento della pagina una volta sola

bool bo = true;

// index per lo state della chiamata al db dalla pagina.dart
int indexState = 0;

Color nero = Color(0);
Color bianco = Color.fromARGB(255, 245, 245, 247);

//SERVER INDIRIZZI

String loophole = 'https://ristorante.loophole.site';
String localhost = 'http://10.0.2.2:4000';
