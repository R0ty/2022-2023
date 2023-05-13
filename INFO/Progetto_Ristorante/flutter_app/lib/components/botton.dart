import 'package:flutter/material.dart';
import '../model/constant.dart';

class BottomAdd extends StatefulWidget {
  final String name;

  BottomAdd({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  BottomAdd2 createState() => BottomAdd2();
}

class BottomAdd2 extends State<BottomAdd> {
  String correzione = "";
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) => Container(
        color: bianco,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: bianco),
          onPressed: () {
            setState(() {
              change1();
            });
          },
          onLongPress: () => openDialog(context),
          child: Text(widget.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black, backgroundColor: bianco, fontSize: 20)),
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
          style: ElevatedButton.styleFrom(backgroundColor: bianco),
          onPressed: () {},
          child: Text(
            name,
            style: TextStyle(color: nero),
          ),
        ),
      );
    }
    //PIATTO CON CORREZION
    else {
      return SizedBox(
          width: 5,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: bianco),
            onPressed: () {},
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  name,
                  style: TextStyle(color: nero),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "correzione: $correzione",
                  style: TextStyle(color: nero),
                ),
              ],
            ),
          ));
    }
  }
}
