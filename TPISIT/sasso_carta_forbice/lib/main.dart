// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'constant/constant.dart';
import 'package:shake/shake.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sasso Carta Forbice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(),
              Text(
                'TU',
                style: TextStyle(color: Colors.cyanAccent, fontSize: 60),
              ),
              SizedBox(
                width: 55,
              ),
              Text(
                'VS',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              SizedBox(
                width: 55,
              ),
              Text('AI', style: TextStyle(color: Colors.orange, fontSize: 60)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$risultatoPL',
                style: TextStyle(fontSize: 35),
              ),
              SizedBox(
                width: 170,
              ),
              Text(
                '$risultatoAI',
                style: TextStyle(fontSize: 35),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          buildScelta(),
          SizedBox(
            height: 120,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                risultatoAI = 0;
                risultatoPL = 0;
                sceltaAI = emoji[3];
                sceltaPL = emoji[3];
              });
            },
            child: Text(
              'Restart',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 120,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              bottoneScelta(emoji[0]),
              SizedBox(
                width: 30,
              ),
              bottoneScelta(emoji[1]),
              SizedBox(
                width: 30,
              ),
              bottoneScelta(emoji[2]),
            ],
          ),
        ],
      ),
    );
  }

  // RIGA DELLA SCELTA
  Widget buildScelta() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          sceltaPL,
          style: TextStyle(
            fontSize: 80,
          ),
        ),
        SizedBox(
          width: 95,
        ),
        Text(
          sceltaAI,
          style: TextStyle(fontSize: 80),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  //COME SI MOSTRA IL BOTTONE DELLA SCELTA
  Widget bottoneScelta(String item) {
    return TextButton(
        onPressed: () {
          setState(
            () {
              sceltaAI = emoji[3];
              sceltaPL = item;
              late final ShakeDetector detector;
              detector = ShakeDetector.waitForStart(
                  shakeThresholdGravity: 1.4                                                                                                                                                   ,
                  onPhoneShake: (() {
                    setState(() {
                      Random rand = Random();
                      int random = rand.nextInt(3);
                      sceltaAI = emoji[random];
                      if (sceltaPL == sceltaAI) {
                        risultatofinale = 'Draw';
                      } else if (sceltaPL == emoji[0] && sceltaAI == emoji[2]) {
                        risultatofinale = 'Victory';
                        risultatoPL++;
                      } else if (sceltaPL == emoji[1] && sceltaAI == emoji[0]) {
                        risultatofinale = 'Victory';
                        risultatoPL++;
                      } else if (sceltaPL == emoji[2] && sceltaAI == emoji[1]) {
                        risultatofinale = 'Victory';
                        risultatoPL++;
                      } else {
                        risultatofinale = 'Lose';
                        risultatoAI++;
                      }

                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          contentPadding: EdgeInsets.all(30),
                          content: Center(
                            heightFactor: 2,
                            widthFactor: 2,
                            child: Text(
                              risultatofinale,
                              style:
                                  TextStyle(color: Colors.purple, fontSize: 40),
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () => setState(() {
                                      Navigator.of(context).pop();
                                    }),
                                child: Text('OK'))
                          ],
                        ),
                      );
                    });

                    detector.stopListening();
                  }));
              detector.startListening();
            },
          );
        },
        child: Text(
          item,
          style: TextStyle(fontSize: 80),
        ));
  }

  casi() {}
}
