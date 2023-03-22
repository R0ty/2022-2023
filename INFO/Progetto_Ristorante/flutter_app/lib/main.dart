import 'package:flutter/material.dart';
import 'package:flutter_app/views/antipasti.dart';
import 'constant/constant.dart';
import 'views/navigationDrawer.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int dropdownvalue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Numero Tavolo  ',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 100,
                child: DropdownButtonFormField<int>(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(width: 2, color: Colors.blueAccent),
                  )),
                  icon: const Icon(
                    Icons.arrow_downward,
                    size: 20,
                  ),
                  value: dropdownvalue,
                  elevation: 16,
                  style:
                      const TextStyle(color: Colors.blueAccent, fontSize: 30),
                  onChanged: (int? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownvalue = value!;
                      tavolo = value;
                      print(tavolo);
                    });
                  },
                  items: list
                      .map((item) => DropdownMenuItem<int>(
                            value: item,
                            child: Text('$item'),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => NaviationDrawar()));
              },
              child: Text(
                ' + Nuovo Ordine',
                style: TextStyle(fontSize: 18),
              ))
        ],
      )),
    );
  }
}
