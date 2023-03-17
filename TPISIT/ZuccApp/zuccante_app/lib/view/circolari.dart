import 'dart:html';

import 'package:flutter/material.dart';
import 'package:zuccante_app/main.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class Circolari extends StatefulWidget {
  @override
  State<Circolari> createState() => _CircolariState();
}

class _CircolariState extends State<Circolari> {
  List<String> title = List.empty();
  @override
  final url =
      "https://web.spaggiari.eu/sdg/app/default/comunicati.php?sede_codice=VEIT0007&referer=https://www.itiszuccante.edu.it";

  final dio = Dio();
  void getHttp() async {
    final response = await dio.get(url);
    dom.Document document = parser.parse(response);
    final elements = document.getElementsByClassName('cell-border');
    title = elements.map((elements) => elements.getElementsByTagName('spam'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circolari',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyApp()));
              },
              icon: Icon(Icons.arrow_left_outlined)),

          // cambio modalità visiva

          centerTitle: true,
          title: Text('Ciroclari'),
        ),
      ),
    );
  }
}
