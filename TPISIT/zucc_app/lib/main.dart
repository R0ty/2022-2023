// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:open_file/src/platform/open_file.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zucc_app/contatti.dart';
import 'posizione.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      body: LayoutBuilder(
        builder: (context, constraints) =>
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: constraints.maxHeight * 0.1,
            width: constraints.maxWidth * 0.4,
            child: Image.asset('assets/logo2.png'),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade400, width: 5)),
            alignment: Alignment.center,
            height: constraints.maxHeight * 0.35,
            width: constraints.maxHeight * 0.35,
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
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade400, width: 1)),
            child: Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Circolari
                    SizedBox.fromSize(
                      size: Size(110, 110),
                      child: ClipRect(
                        child: Material(
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.email,
                                  color: Colors.blue.shade400,
                                  size: 50,
                                ), // <-- Icon
                                Text(
                                  "Circolari",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue.shade400),
                                ), // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    //News
                    SizedBox.fromSize(
                      size: Size(110, 110),
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
                                  color: Colors.white,
                                ), // <-- Icon
                                Text(
                                  "News",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ), // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox.fromSize(
                      size: Size(110, 110),
                      child: ClipRect(
                        child: Material(
                          child: InkWell(
                            onTap: () => openFile(
                                url:
                                    'https://www.itiszuccante.edu.it/sites/default/files/page/2022/classi_dal_28_novembre.pdf',
                                fileName: 'orario.pdf'),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.schedule,
                                  color: Colors.blue.shade400,
                                  size: 50,
                                ), // <-- Icon
                                Text(
                                  "Orario",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue.shade400),
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
                      size: Size(110, 110),
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
                                  color: Colors.white,
                                ), // <-- Icon
                                Text(
                                  "Contatti",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ), // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    //Calendario

                    SizedBox.fromSize(
                      size: Size(110, 110),
                      child: ClipRect(
                        child: Material(
                          child: InkWell(
                            onTap: () => _launchUrl(
                                Uri.parse('https://www.itiszuccante.edu.it/')),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.web,
                                  size: 50,
                                  color: Colors.blue.shade400,
                                ), // <-- Icon
                                Text(
                                  "WEB",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue.shade400),
                                ), // <-- Text
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox.fromSize(
                      size: Size(110, 110),
                      child: ClipRect(
                        child: Material(
                          color: Colors.blue.shade400,
                          child: InkWell(
                            onTap: () => _launchUrl(Uri.parse(
                                'https://www.itiszuccante.edu.it/calendario-scolastico')),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.calendar_month_outlined,
                                  size: 50,
                                  color: Colors.white,
                                ), // <-- Icon
                                Text(
                                  "Calendario",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
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
                  height: constraints.maxHeight * 0.02,
                )
              ],
            ),
          ),
        ]),
      ));
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future openFile({required String url, required String fileName}) async {
    final file = await downloadFile(url, fileName!);

    if (file == null) return;

    print('Path : ${file.path}');
    OpenFile.open(file.path);
  }

  //Download in a private folder not to visibile for user
  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: Duration(seconds: 0),
        ),
      );

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e) {
      return null;
    }
  }
}
