
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
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildProductsList(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),

                // BOTTONE ELIMINA TUTTO
                /*
                TextButton(
                  child: Text('Elimina ',
                      style: TextStyle(
                          color: Colors.pink.shade200,
                          fontSize: 25,
                          fontStyle: FontStyle.italic)),
                  onPressed: () {
                    setState(() {
                      totalOrder = "";
                      orderForResp = "";
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text('Ordine Eliminato'),
                              actions: [
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () => Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) => Tavolo(),
                                  )),
                                ),
                              ],
                            );
                          });
                    });
                  },
                ),
                SizedBox(
                  width: 160,
                ),
              */
                TextButton(
                    child: Text(
                      'Invia',
                    ),
                    onPressed: () {
                      // BOTTONE CHE INVIA TUTTO
                      setState(() {
                        
                        postRequest(context);
                      });
                      
                    }),
              ],
            ),
          ],
        ),
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
        return Piatto(name: item.piatto, correzione: item.correzione);
      },
    );
  }
}
