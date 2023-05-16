import 'package:flutter_app/model/constant.dart';
import 'package:flutter/material.dart';
import '../components/botton.dart';

class Ordini extends StatefulWidget {
  @override
  _Ordini createState() => _Ordini();
}

class _Ordini extends State<Ordini> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                SingleChildScrollView(
                  child: Container(
                    width: constraints.maxWidth * 0.8,
                    height: constraints.maxHeight * 0.8,
                    child: _buildProductsList(),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Center(
                    child: SizedBox(
                  width: constraints.maxWidth * 0.4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: bianco),
                    child: Text(
                      'Invia',
                      style: TextStyle(color: nero, fontSize: 25),
                    ),
                    onPressed: () {
                      // BOTTONE CHE INVIA TUTTO
                      setState(() {
                        postRequest(context);
                      });
                    },
                  ),
                )),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductsList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Piatto(
          name: item.piatto,
          correzione: item.correzione,
          index: index,
        );
      },
    );
  }
}
