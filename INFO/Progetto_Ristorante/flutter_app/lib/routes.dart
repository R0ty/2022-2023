import 'package:flutter/material.dart';
import 'screens/ordine.dart';
import 'dart:async';
import 'screens/pagina.dart';
class NaviationDrawar extends StatefulWidget {
  @override
  State<NaviationDrawar> createState() => _NaviationDrawarState();
}

class _NaviationDrawarState extends State<NaviationDrawar> {
  int currentPageIndex = 0;
  List<Widget> _pages = <Widget>[
    ProductsPage(getter: "/getAntipasti"),
    ProductsPage(getter: "/getPrimi"),
    ProductsPage(getter: "/getSecondi"),
    ProductsPage(getter: "/getDessert"),
    ProductsPage(getter: "/getBevande"),
    Ordini()
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _pages[currentPageIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
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
