import 'dart:convert';
import 'package:flutter_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/functions/Botton.dart';

//STARTER GET
class Starter extends StatelessWidget {
  Future<List<Food>> futureFoods = getFood();

  static Future<List<Food>> getFood() async {
    const url = 'http://10.0.2.2:4000/getStarter';
    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);
    return body.map<Food>(Food.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: Color.fromARGB(255, 37, 40, 80),
        appBar: AppBar(
          title: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            'Starter',
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
                            'Starter',
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

//FIRST GET
class First extends StatelessWidget {
  Future<List<Food>> futureFoods = getFood();

  static Future<List<Food>> getFood() async {
    const url = 'http://10.0.2.2:4000/getFirst';
    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);
    return body.map<Food>(Food.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: Color.fromARGB(255, 37, 40, 80),
        appBar: AppBar(
          title: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            'First',
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
                            'First',
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

//SECOND GET
class Second extends StatelessWidget {
  Future<List<Food>> futureFoods = getFood();

  static Future<List<Food>> getFood() async {
    const url = 'http://10.0.2.2:4000/getSecond';
    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);
    return body.map<Food>(Food.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: Color.fromARGB(255, 37, 40, 80),
        appBar: AppBar(
          title: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            'Second',
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
                            'Second',
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

// DESSERT GET
class Dessert extends StatelessWidget {
  Future<List<Food>> futureFoods = getFood();

  static Future<List<Food>> getFood() async {
    const url = 'http://10.0.2.2:4000/getDessert';
    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);
    return body.map<Food>(Food.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: Color.fromARGB(255, 37, 40, 80),
        appBar: AppBar(
          title: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            'Dessert',
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
                            'Dessert',
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

//DRINK GET

class Drink extends StatelessWidget {
  Future<List<Food>> futureFoods = getFood();

  static Future<List<Food>> getFood() async {
    const url = 'http://10.0.2.2:4000/getDrink';
    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);
    return body.map<Food>(Food.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: Color.fromARGB(255, 37, 40, 80),
        appBar: AppBar(
          title: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            'Drink',
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
                            'Drink',
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

// ORDER

class Order extends StatefulWidget {
  @override
  Order2 createState() => Order2();
}

class Order2 extends State<Order> {
  TextEditingController editingController = TextEditingController();

  var tavolo;
  var text;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Order',
      home: Scaffold(
        drawer: NavigationDrawer(),
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
              //BOX PER SCRIVERE IL TAVOLO
              TextField(
                controller: editingController,
                decoration: InputDecoration(hintText: 'Enter your Table', hintStyle: TextStyle(color: Colors.white)),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),

              Container(
                padding: EdgeInsets.only(top: 20)
              ),
              Text("Ordine:" , style: TextStyle(color: Colors.pink.shade200, fontSize: 25, fontStyle: FontStyle.italic)),
              Text(
                  '$totalOrder',
                  style: TextStyle(color: Colors.white, fontSize: 20)),

              

              Row(children: [
                TextButton(
              child: Text('Elimina ', style: TextStyle(color: Colors.pink.shade200, fontSize: 25, fontStyle: FontStyle.italic)),
              onPressed: (){
                setState(() {
                  totalOrder = "";
                  orderForResp = "";
                  showDialog(
                          context: context,
                          builder: (BuildContext context) {
                                      return AlertDialog(
                                        content:
                                          Text('Ordine Eliminato'),
                                        actions: [
                                          TextButton(
                                            child: Text('OK'),
                                              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HomePage(),
                                                    )),
                                          ),
                                        ],
                                      );
                          }
                    );
                });
              }, 
              
              ),
              Container(
                padding: EdgeInsets.only(right: 130),
              ),
              TextButton(
                  child:
                      Text('Invia', style: TextStyle(color: Colors.pink.shade200, fontSize: 25, fontStyle: FontStyle.italic)),
                  onPressed: () {
                    setState(() {
                      tavolo = editingController.text;
                      http.post(Uri.parse('http://10.0.2.2:4000/post/$orderForResp/$tavolo'),
                                );
                      showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                          return AlertDialog(
                                                content:
                                                    Text('Ordine ricevuto'),
                                                actions: [
                                                  TextButton(
                                                    child: Text('OK'),
                                                    onPressed: () => Navigator
                                                            .of(context)
                                                        .push(MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HomePage(),
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

/*
class Pagina extends StatelessWidget {
  final String name;
  Pagina({
    Key? key,
    required this.name,
  }) : super(key: key);

  Future<List<Food>> futureFoods = getFood();

  static Future<List<Food>> getFood() async {
    var url = 'http://10.0.2.2:4000/get${name}';
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);
    return body.map<Food>(Food.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: Colors.blue.shade700,
        appBar: AppBar(
          title: new Text(name),
          centerTitle: true,
          backgroundColor: Colors.blue.shade700,
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

            return Container(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Card(
                child: ListTile(
                  tileColor: Colors.blue.shade400,
                  title: Text(food.name, style: TextStyle(color: Colors.white)),
                  subtitle: Text(
                    food.description,
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            );
        },
      );
}
*/