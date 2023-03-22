import 'package:flutter_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:http/http.dart' as http;

class Ordini extends StatefulWidget {
  @override
  _Ordini createState() => _Ordini();
}

class _Ordini extends State<Ordini> {
  TextEditingController editingController = TextEditingController();

  var tavolo;
  var text;
  @override
  Widget build(BuildContext context) {
    return Center(
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
              style: TextStyle(color: Colors.black, fontSize: 20)),
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
                              onPressed: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
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
    );
  }
}
