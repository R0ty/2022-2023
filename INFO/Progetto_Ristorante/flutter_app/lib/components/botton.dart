import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

// PIATTI VISUALIZZATI NELLA PAGINE DELL ORDINAZIONE FINALE

class Piatto extends StatefulWidget {
  final String name;
  final String correzione;
  final int index;
  Piatto(
      {Key? key,
      required this.name,
      required this.correzione,
      required this.index})
      : super(key: key);

  @override
  State<Piatto> createState() => _PiattoState();
}

class _PiattoState extends State<Piatto> {
  String newCorrezzione = "";
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 20,
        child: Divider(
          color: bianco,
        ),
      ),
      Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: bianco),
          onPressed: () => openDialog(context),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              _correzzione(),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    ]);
  }

  Widget _correzzione() {
    if (widget.correzione == "") {
      return Text(
        widget.name,
        style: TextStyle(color: nero),
      );
    } else {
      return Column(
        children: [
          Text(
            widget.name,
            style: TextStyle(color: nero),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Correzzione: ${widget.correzione}",
            style: TextStyle(color: nero),
          )
        ],
      );
    }
  }

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
                onPressed: () => Navigator.of(context).pop()),
            TextButton(
              child: Text('OK'),
              onPressed: () => setState(() {
                newCorrezzione = editingController.text;
                print('$indexState');
                modifyCorrezione(widget.index, newCorrezzione);
                Navigator.of(context).pop();
                newCorrezzione = "";
              }),
            ),
          ],
        ),
      );
  void modifyCorrezione(int index, String newCorrezione) {
    // Effettua la modifica nella tua lista di oggetti
    items[index].correzione = newCorrezione;
  }
}
