import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zuccante_app/view/circolari.dart';
import 'package:zuccante_app/view/news.dart';
import 'contatti.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade100,
      body: Column(
        children: [
          Row(
            children: [
              //Circolari
              SizedBox(
                width: 50,
                height: 150,
              ),
              SizedBox.fromSize(
                size: Size(100, 100),
                child: ClipRect(
                  child: Material(
                    color: Colors.lightBlueAccent.shade100,
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Circolari())),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            CupertinoIcons.doc_text,
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
                width: 80,
              ),
              SizedBox.fromSize(
                size: Size(100, 100),
                child: ClipRect(
                  child: Material(
                    color: Colors.lightBlueAccent.shade100,
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => News())),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            CupertinoIcons.news,
                            size: 50,
                          ), // <-- Icon
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
            children: [
              //Contatct
              SizedBox(
                width: 50,
                height: 100,
              ),
              SizedBox.fromSize(
                size: Size(100, 100),
                child: ClipRect(
                  child: Material(
                    color: Colors.lightBlueAccent.shade100,
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
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
                width: 80,
              ),
              SizedBox.fromSize(
                size: Size(100, 100),
                child: ClipRect(
                  child: Material(
                    color: Colors.lightBlueAccent.shade100,
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => News())),
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
          )
        ],
      ));
}
