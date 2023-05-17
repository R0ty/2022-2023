// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:zucc_app/contatti.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zucc_App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'HOME'),
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
  final PageController _pageController = PageController();
  int currentPageIndex = 0;

  final List<String> _imagePaths = [
    'assets/zuccante1.jpg',
    'assets/zuccante2.jpg',
    'assets/zuccante3.jpg',
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 100,
          width: 400,
          child: Image.asset('assets/logo2.png'),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          alignment: Alignment.center,
          height: 350,
          width: 350,
          child: PageView.builder(
            reverse: true,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            itemCount: _imagePaths.length,
            itemBuilder: (context, index) {
              return Image.asset(
                _imagePaths[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          width: 300,
          color: Colors.blue.shade400,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Circolari
                  SizedBox.fromSize(
                    size: Size(100, 100),
                    child: ClipRect(
                      child: Material(
                        color: Colors.blue.shade400,
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.newspaper,
                                size: 50,
                              ), // <-- Icon
                              Text(
                                "Circolari",
                                style: TextStyle(fontSize: 20),
                              ), // <-- Text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  //News
                  SizedBox(
                    width: 40,
                  ),
                  SizedBox.fromSize(
                    size: Size(100, 100),
                    child: ClipRect(
                      child: Material(
                        color: Colors.blue.shade400,
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              /*Icon(
                            CupertinoIcons.news,
                            size: 50,
                          ),*/ // <-- Icon
                              Text(
                                "News",
                                style: TextStyle(fontSize: 20),
                              ), // <-- Text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Contatct
                  SizedBox.fromSize(
                    size: Size(100, 100),
                    child: ClipRect(
                      child: Material(
                        color: Colors.blue.shade400,
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ContattiPage())),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.contact_page_outlined,
                                size: 50,
                              ), // <-- Icon
                              Text(
                                "Contatti",
                                style: TextStyle(fontSize: 20),
                              ), // <-- Text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Calendario
                  SizedBox(
                    width: 40,
                  ),
                  SizedBox.fromSize(
                    size: Size(100, 100),
                    child: ClipRect(
                      child: Material(
                        color: Colors.blue.shade400,
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ContattiPage())),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 50,
                              ), // <-- Icon
                              Text(
                                "Calendario",
                                style: TextStyle(fontSize: 20),
                              ), // <-- Text
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ]));
}
