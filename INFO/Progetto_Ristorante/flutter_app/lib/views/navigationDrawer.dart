import 'package:flutter/material.dart';
import 'package:flutter_app/views/secondi.dart';
import 'antipasti.dart';
import 'bevande.dart';
import 'dessert.dart';

import 'ordine.dart';
import 'primi.dart';

class Navigationdrawer extends StatelessWidget {
  const Navigationdrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: Color.fromARGB(255, 61, 60, 60),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
                leading: const Icon(Icons.keyboard_arrow_right_sharp),
                title: Text(
                  'Starter',
                  style: TextStyle(color: Colors.pink.shade200, fontSize: 20),
                ),
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Antipasti(),
                  ));
                }),
            ListTile(
              leading: const Icon(Icons.keyboard_arrow_right_sharp),
              title: Text(
                'First',
                style: TextStyle(color: Colors.pink.shade200, fontSize: 20),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Primi(),
              )),
            ),
            ListTile(
                leading: const Icon(Icons.keyboard_arrow_right_sharp),
                title: Text(
                  'Second',
                  style: TextStyle(color: Colors.pink.shade200, fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Secondi(),
                  ));
                }),
            ListTile(
              leading: const Icon(Icons.keyboard_arrow_right_sharp),
              title: Text(
                'Dessert',
                style: TextStyle(color: Colors.pink.shade200, fontSize: 20),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Dessert(),
              )),
            ),
            ListTile(
              leading: const Icon(Icons.keyboard_arrow_right_sharp),
              title: Text(
                'Drink',
                style: TextStyle(color: Colors.pink.shade200, fontSize: 20),
              ),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Bevande())),
            ),
            const Divider(color: Color.fromARGB(229, 0, 0, 0)),
            ListTile(
              leading: const Icon(Icons.add_shopping_cart),
              title: Text(
                'Order',
                style: TextStyle(color: Colors.pink.shade200, fontSize: 20),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Ordini(),
              )),
            ),
          ],
        ),
      );
}
