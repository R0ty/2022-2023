import 'dart:convert';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'navigationDrawer.dart';
import 'package:flutter_app/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/functions/Botton.dart';

class Secondi extends StatefulWidget {

  static Future<List<Food>> getFood() async {
    const url = 'http://10.0.2.2:4000/getSecondi';
    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);
    return body.map<Food>(Food.fromJson).toList();
  }

  @override
  State<Secondi> createState() => _SecondiState();
}

class _SecondiState extends State<Secondi> {
  Future<List<Food>> futureFoods = Secondi.getFood();

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: Navigationdrawer(),
        backgroundColor: Color.fromARGB(255, 37, 40, 80),
        appBar: AppBar(
          title: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            'Secondi',
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
                            'Secondi',
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
          child: FutureBuilder<List<Food>>(
            future: futureFoods,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final foods = snapshot.data!;

                return buildFood(foods);
              } else {
                return const Text('No food data.');
              }
            },
          ),
        ),
      );

  Widget buildFood(List<Food> foods) => ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final food = foods[index];

          return BottomForOrder(name: food.name, descr: food.description);
        },
      );
}
