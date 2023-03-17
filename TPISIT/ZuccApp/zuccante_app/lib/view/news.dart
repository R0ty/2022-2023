import 'package:flutter/material.dart';
import 'package:zuccante_app/main.dart';

class News extends StatefulWidget {
  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyApp()));
              },
              icon: Icon(Icons.arrow_left_outlined)),

          // cambio modalità visiva
          actions: [],
          centerTitle: true,
          title: Text('News'),
        ),
      ),
    );
  }
}
