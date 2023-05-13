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
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Container(
              width: 300,
              height: 400,
              child: _buildProductsList(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: TextButton(
                child: Text(
                  'Invia',
                  style: TextStyle(color: bianco, fontSize: 20),
                ),
                onPressed: () {
                  // BOTTONE CHE INVIA TUTTO
                  setState(() {
                    postRequest(context);
                  });
                }),
          ),
        ],
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
