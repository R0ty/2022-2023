import 'package:flutter/material.dart';
import 'package:zuccante_app/view/home.dart';
/*import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'zuccante_app',
      debugShowCheckedModeBanner: false,
      // ignore: unnecessary_new
      home: Home(),
    );
  }
}
