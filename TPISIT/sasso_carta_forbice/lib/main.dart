import 'package:flutter/material.dart';
import 'constant/emoji.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var sceltaPL = emoji[0];
  var sceltaAI = emoji[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 120,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'YOU',
                style: TextStyle(color: Colors.cyanAccent, fontSize: 30),
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                'VS',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                width: 50,
              ),
              Text('AI',
                  style: TextStyle(color: Colors.redAccent, fontSize: 30)),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              SizedBox(
                width: 110,
              ),
              Text(
                sceltaPL,
                style: TextStyle(fontSize: 60),
              ),
              SizedBox(
                width: 70,
              ),
              Text(
                sceltaAI,
                style: TextStyle(fontSize: 60),
              ),
            ],
          )
        ],
      ),
    );
  }
}
