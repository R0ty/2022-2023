import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/views/pagina.dart';
import 'ordine.dart';

class NaviationDrawar extends StatefulWidget {
  @override
  State<NaviationDrawar> createState() => _NaviationDrawarState();
}

class _NaviationDrawarState extends State<NaviationDrawar> {
  int currentPageIndex = 0;
  List pages = [
    new ProductsPage(getter: "/getAntipasti"),
    new ProductsPage(getter: "/getPrimi"),
    new ProductsPage(getter: "/getSecondi"),
    new ProductsPage(getter: "/getDessert"),
    new ProductsPage(getter: "/getBevande"),
    new Ordini()
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: pages[currentPageIndex],
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
