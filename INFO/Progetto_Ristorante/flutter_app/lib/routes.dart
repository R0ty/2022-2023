import 'package:flutter/material.dart';
import 'screens/ordine.dart';
import 'screens/pagina.dart';
import 'model/constant.dart';

class NaviationDrawar extends StatefulWidget {
  @override
  State<NaviationDrawar> createState() => NaviationDrawarState();
}

class NaviationDrawarState extends State<NaviationDrawar> {
  List<Widget> _pages = <Widget>[
    new ProductsPage(getter: "/getAntipasti"),
    new ProductsPage(getter: "/getPrimi"),
    new ProductsPage(getter: "/getSecondi"),
    new ProductsPage(getter: "/getDessert"),
    new ProductsPage(getter: "/getBevande"),
    Ordini()
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _pages[indexState],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              indexState = index;

              bo = true;
            });
          },
          selectedIndex: indexState,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.add_circle),
              icon: Icon(Icons.add_circle_outline),
              label: 'Antipasti',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.add_circle),
              icon: Icon(Icons.add_circle_outline),
              label: 'Primi',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.add_circle),
              icon: Icon(Icons.add_circle_outline),
              label: 'Secondi',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.add_circle),
              icon: Icon(Icons.add_circle_outline),
              label: 'Dessert',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.add_circle),
              icon: Icon(Icons.add_circle_outline),
              label: 'Bevande',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.add_circle),
              icon: Icon(Icons.add_circle_outline),
              label: 'Ordine',
            ),
          ],
        ),
      );
}
