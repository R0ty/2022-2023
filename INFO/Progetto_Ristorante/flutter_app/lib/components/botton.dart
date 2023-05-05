import 'package:flutter/material.dart';
import '../model/constant.dart';

class BottomAdd extends StatefulWidget {
  final String name;

  BottomAdd({Key? key, required this.name, })
      : super(key: key);

  @override
  BottomAdd2 createState() => BottomAdd2();
}

class BottomAdd2 extends State<BottomAdd> {
  String correzione = "";
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade200),
        onPressed: () {
          setState(() {
            change1();
          });
        },
        onLongPress: () => openDialog(context),
        child: Container(
          color: Colors.grey.shade200,
          padding: EdgeInsets.only(bottom: 20.0),
          child: Card(
            child: Text(widget.name,
                style: TextStyle(
                    color: Colors.black,
                    backgroundColor: Colors.grey.shade200)),
          ),
        ),
      );

  // finestra che si apre quando tengo premuto il tasto

  Future openDialog(var context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Correzione'),
          content: TextField(
            controller: editingController,
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => submit(context),
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () => setState(() {
                correzione = editingController.text;
                change();
                print('$indexState');
                submit(context);
                correzione = "";
              }),
            ),
          ],
        ),
      );
  void submit(var context) {
    Navigator.of(context).pop();
  }
  //ITEM QUANDO TENGO PREMUTO IL TASTO

  void change() {
    setState(() {
      items.add(Item(
          piatto: widget.name, correzione: ('$correzione'), tavolo: tavolo));
    });
  }

  void change1() {
    setState(() {
      items.add(Item(piatto: widget.name, correzione: "", tavolo: tavolo));
    });
  }
}

// BOTTONE PER ORDINARE

class Piatto extends StatelessWidget {
  final String name;
  final String correzione;

  Piatto({
    Key? key,
    required this.name,
    required this.correzione,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //PIATTO SENZA CORREZIONE
    if (correzione == "") {
      return SizedBox(
        width: 5,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(name),
        ),
      );
    }
    //PIATTO CON CORREZION
    else {
      return SizedBox(
        width: 5,
        height: 50,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(name),
            SizedBox(
              width: 20,
            ),
            Text("correzione: $correzione"),
          ],
        ),
      );
    }
  }
}
