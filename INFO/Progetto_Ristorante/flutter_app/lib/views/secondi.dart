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
  Widget build(BuildContext context) => Center(
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
      );

  Widget buildFood(List<Food> foods) => ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final food = foods[index];

          return BottomForOrder(name: food.name, descr: food.description);
        },
      );
}
