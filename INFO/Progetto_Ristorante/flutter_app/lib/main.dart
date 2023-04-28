import 'package:flutter/material.dart';
import 'screens/tavolo.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App Camerieri',
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}

