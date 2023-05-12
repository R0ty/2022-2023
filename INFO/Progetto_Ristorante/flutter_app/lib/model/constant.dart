import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../screens/tavolo.dart';

// LISTA DEI TAVOLO

const List<String> list = <String>[
  "0",
  "1",
  "2",
  "3",
];

// TAVOLO SCELTO

String tavolo = list[0];

//usato per fare l'aggiornamento della pagina una volta sola

bool bo = true;

// index per lo state della chiamata al db dalla pagina.dart
int indexState = 0;

// COLORI DELLA APPLICAZIONE

Color nero = Colors.black;
Color bianco = Color.fromARGB(255, 245, 245, 247);

//SERVER INDIRIZZo

String url = localhost;
String loophole = 'https://ristorante.loophole.site';
String localhost = 'http://10.0.2.2:4000';

// ITEM PER COSTRUIRE GLI OGGETTI CHE VERRANNO VISUALIZZAI NELLA PAGINE E POI INVIATI AL DB

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
    var _url = Uri.parse('$url/ordinazioni');
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
    var response = await http.post(_url, headers: headers, body: body);
    if (response.statusCode == 200) {
      //DIALOG DOPO AVER INVIATO L 'ORDINE

      // ignore: unused_local_variable
      items = [];
      indexState = 0;
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
