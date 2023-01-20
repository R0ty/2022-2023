import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/constant.dart';

class BottomForOrder extends StatefulWidget {
  final String name;
  final String descr;

  BottomForOrder({
    Key? key,
    required this.name,
    required this.descr,
  }) : super(key: key);

  @override
  BottomForOrder2 createState() => BottomForOrder2();
}

class BottomForOrder2 extends State<BottomForOrder> {
  var numP;
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 37, 40, 80)),
        onPressed: () {
          openDialog();
        },
        
        child: Container(
          color: Color.fromARGB(255, 37, 40, 80),
          padding: EdgeInsets.only(bottom: 20.0),
          child: Card(
            child: ListTile(
              tileColor: Color.fromARGB(255, 37, 40, 80),
              title: Text(widget.name, style: TextStyle(color: Color.fromARGB(255, 247, 171, 197))),
              subtitle: Text(
                widget.descr,
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),
        ),
      );

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Numero di Piatti'),
          content: TextField(
            controller: editingController,
            decoration: InputDecoration(hintText: 'Enter your Number'),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => submit(),
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () => setState(() {
                numP = editingController.text;
                submit();
                change();
              }),
            ),
          ],
        ),
      );

  void submit() {
    Navigator.of(context).pop();
  }

  void change() {
    setState(() {
      totalOrder = totalOrder + '${widget.name} : $numP \n';
      orderForResp = orderForResp + '${widget.name} : $numP ,';
    });
  }
}
