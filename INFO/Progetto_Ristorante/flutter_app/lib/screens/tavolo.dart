import 'package:flutter/material.dart';
import '../model/constant.dart';
import '../routes.dart';

class Tavolo extends StatefulWidget {
  @override
  State<Tavolo> createState() => _TavoloState();
}

class _TavoloState extends State<Tavolo> {
  String dropdownvalue = list.first;

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
                child: DropdownButtonFormField<String>(
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
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownvalue = value!;
                      tavolo = value;
                      print(tavolo);
                    });
                  },  
                  items: list
                      .map((item) => DropdownMenuItem<String>(
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
