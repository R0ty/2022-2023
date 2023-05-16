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
      body: Container(
        color: nero,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Numero Tavolo  ',
                  style: TextStyle(fontSize: 20, color: bianco),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 100,
                  child: DropdownButtonFormField<String>(
                    menuMaxHeight: 300,
                    alignment: Alignment.center,
                    isExpanded: true,
                    isDense: true,
                    dropdownColor: nero,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: bianco)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 2, color: bianco),
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_downward,
                      size: 20,
                      color: bianco,
                    ),
                    value: dropdownvalue,
                    elevation: 10,
                    style: TextStyle(fontSize: 25, color: bianco),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownvalue = value!;
                        tavolo = value;
                      });
                    },
                    items: list
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                '$item',
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: bianco),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NaviationDrawar()));
                },
                child: Text(
                  ' + Nuovo Ordine',
                  style: TextStyle(fontSize: 20, color: nero),
                ))
          ],
        )),
      ),
    );
  }
}
