import 'dart:convert';

import 'package:flutter_app/model/constant.dart';
import 'package:flutter/material.dart';
import 'tavolo.dart';
import 'package:http/http.dart' as http;
import '../components/botton.dart';

class Ordini extends StatefulWidget {
  @override
  _Ordini createState() => _Ordini();
}

class _Ordini extends State<Ordini> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProductsList(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                // BOTTONE ELIMINA TUTTO
                /*
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
                                    builder: (context) => Tavolo(),
                                  )),
                                ),
                              ],
                            );
                          });
                    });
                  },
                ),
                SizedBox(
                  width: 160,
                ),
              */
                //BOTTONE CHE INVIA

                TextButton(
                    child: Text(
                      'Invia',
                    ),
                    onPressed: () {
                      // BOTTONE CHE INVIA TUTTO
                      setState(() {
                        Future<void> postRequest() async {
                          try {
                            var url = Uri.parse('$localhost/ordinazioni');
                            var headers = {'Content-Type': 'application/json'};
                            List<Map<String, dynamic>> foodJson =
                                items.map((Item) => Item.toJson()).toList();
                            print(foodJson);
                            var response = await http.post(url,
                                headers: headers, body: foodJson);
                            if (response.statusCode == 200) {
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

                        postRequest();
                      });
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Piatto(name: item.name, correzione: item.correzione);
      },
    );
  }
}
