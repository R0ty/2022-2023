import 'dart:convert';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/main.dart';
import 'navigationDrawer.dart';
import 'package:flutter_app/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/functions/Botton.dart';

class Ordini extends StatefulWidget {
  @override
  Ordini2 createState() => Ordini2();
}

class Ordini2 extends State<Ordini> {
  TextEditingController editingController = TextEditingController();

  var tavolo;
  var text;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Order',
      home: Scaffold(
        drawer: Navigationdrawer(),
        backgroundColor: Color.fromARGB(255, 37, 40, 80),
        appBar: AppBar(
          title: Stack(
            children: <Widget>[
              // Stroked text as border.
              Text(
                'Carrello',
                style: TextStyle(
                  fontSize: 40,
                  fontStyle: FontStyle.italic,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = Colors.pink.shade300,
                ),
              ),
              // Solid text as fill.
              Text(
                'Carrello',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 37, 40, 80),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(children: <Widget>[
              Container(padding: EdgeInsets.only(top: 20)),
              Text("Ordine:",
                  style: TextStyle(
                      color: Colors.pink.shade200,
                      fontSize: 25,
                      fontStyle: FontStyle.italic)),
              Text('$totalOrder',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              Row(children: [
                TextButton(
                  child: Text('Elimina ',
                      style: TextStyle(
                          color: Colors.pink.shade200,
                          fontSize: 25,
                          fontStyle: FontStyle.italic)),
                  onPressed: () {
                    setState(() {
                      totalOrder = "";
                      orderForResp = "";
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text('Ordine Eliminato'),
                              actions: [
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () => Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) => Home(),
                                  )),
                                ),
                              ],
                            );
                          });
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.only(right: 130),
                ),
                TextButton(
                    child: Text('Invia',
                        style: TextStyle(
                            color: Colors.pink.shade200,
                            fontSize: 25,
                            fontStyle: FontStyle.italic)),
                    onPressed: () {
                      setState(() {
                        tavolo = editingController.text;
                        http.post(
                          Uri.parse(
                              'http://10.0.2.2:4000/post/$orderForResp/$tavolo'),
                        );
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text('Ordine ricevuto'),
                                actions: [
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => Home(),
                                    )),
                                  ),
                                ],
                              );
                            });
                      });
                    }),
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}
