import 'package:flutter/material.dart';
import 'secondi.dart';
import 'antipasti.dart';
import 'bevande.dart';
import 'dessert.dart';
import 'ordine.dart';
import 'primi.dart';

class NaviationDrawar extends StatefulWidget {
  @override
  State<NaviationDrawar> createState() => _NaviationDrawarState();
}

class _NaviationDrawarState extends State<NaviationDrawar> {
  int currentPageIndex = 0;
  final pages = [
    Antipasti(),
    Primi(),
    Secondi(),
    Dessert(),
    Bevande(),
    Ordini()
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

  Widget buildDestination(String name) {
    return NavigationDestination(
      selectedIcon: Icon(Icons.add_circle),
      icon: Icon(Icons.add_circle_outline),
      label: name,
    );
  }
}
