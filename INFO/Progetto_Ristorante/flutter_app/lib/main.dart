import 'package:flutter/material.dart';
import 'package:flutter_app/views/view.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      backgroundColor: Color.fromARGB(255, 37, 40, 80),
      appBar: AppBar(
        title: Stack(
          children: <Widget>[
            // Stroked text as border.
            Text(
              'Home',
              style: TextStyle(
                fontSize: 40,
                fontStyle: FontStyle.italic,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 6
                  ..color = Colors.pink.shade300,
              ),
            ),
            // Solid text as fill.
            Text(
              'Home',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 37, 40, 80),
      ),
      body: Center(
        child: Column(
            children: [
              Image.asset('assets/logo.png'), // <-- SEE HERE
               ]
          
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

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
              leading: const Icon(Icons.food_bank),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.pink.shade200, fontSize: 20),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage(),
              )),
            ),
            ListTile(
                leading: const Icon(Icons.keyboard_arrow_right_sharp),
                title: Text(
                  'Starter',
                  style: TextStyle(color: Colors.pink.shade200, fontSize: 20),
                ),
                onTap: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Starter(),
                  ));
                }),
            ListTile(
              leading: const Icon(Icons.keyboard_arrow_right_sharp),
              title: Text(
                'First',
                style: TextStyle(color: Colors.pink.shade200, fontSize: 20),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => First(),
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
                    builder: (context) => Second(),
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
                  .push(MaterialPageRoute(builder: (context) => Drink())),
            ),
            const Divider(color: Color.fromARGB(229, 0, 0, 0)),
            ListTile(
              leading: const Icon(Icons.add_shopping_cart),
              title: Text(
                'Order',
                style: TextStyle(color: Colors.pink.shade200, fontSize: 20),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Order(),
              )),
            ),
          ],
        ),
      );
}
