import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'model/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Future<List<Order>> futureOrders = getOrder();

  static Future<List<Order>> getOrder() async {
    const url = 'http://10.0.2.2:4000/getRisposta';
    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);
    return body.map<Order>(Order.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue.shade700,
        appBar: AppBar(
          title: const Text('Ordini'),
          centerTitle: true,
          backgroundColor: Colors.blue.shade700,
        ),
        body: Align(
          alignment: Alignment.centerLeft,
          child: FutureBuilder<List<Order>>(
            future: futureOrders,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final Orders = snapshot.data!;

                return buildOrder(Orders);
              } else {
                return const Text('No Order data.');
              }
            },
          ),
        ),
      );

  Widget buildOrder(List<Order> Orders) => ListView.builder(
        itemCount: Orders.length,
        itemBuilder: (context, index) {
          final Order = Orders[index];
          return Container(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Card(
              child: ListTile(
                tileColor: Colors.blue.shade400,
                title: Text('Tavolo ${Order.tavolo.toString()}',
                    style: TextStyle(color: Colors.white)),
                subtitle: Text(
                  Order.ordine,
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          );
        },
      );
}
