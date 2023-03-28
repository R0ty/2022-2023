import 'package:flutter_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:http/http.dart' as http;

import '../constant/Botton.dart';

class Ordini extends StatefulWidget {
  @override
  _Ordini createState() => _Ordini();
}

class _Ordini extends State<Ordini> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(50),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text("Ordine:",
                style: TextStyle(
                    color: Colors.pink.shade200,
                    fontSize: 25,
                    fontStyle: FontStyle.italic)),
            _buildProductsList(),
            /*
            Row(
              children: [
                // BOTTONE ELIMINA TUTTO
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
                SizedBox(
                  width: 40,
                ),
                TextButton(
                    child: Text('Invia',
                        style: TextStyle(
                            color: Colors.pink.shade200,
                            fontSize: 25,
                            fontStyle: FontStyle.italic)),
                    onPressed: () {
                      // BOTTONE CHE INVIA TUTTO
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
              ],
            ),*/
          ],
        ),
      ),
    );
  }

  Widget _buildProductsList() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return BottomForOrder(name: item.name, correzione: item.correzione);
      },
    );
  }
}
