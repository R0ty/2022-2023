import 'package:flutter/material.dart';
import 'screens/loginPage.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenView(
        backgroundColor: Colors.white,
        duration: 6000,
        imageSize: 200,
        imageSrc: "assets/logo.png",
        text: "App Camerieri  ",
        textType: TextType.ColorizeAnimationText,
        textStyle: TextStyle(
          fontSize: 40.0,
        ),
        colors: [Colors.black, Colors.grey.shade100, Colors.black],
        navigateRoute: HomePage(),
      ),
    );
  }
}

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
        home: LoginPage());
  }
}
