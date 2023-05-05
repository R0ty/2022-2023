import 'package:flutter/material.dart';
import 'package:flutter_app/model/constant.dart';
import 'package:flutter_app/model/food.dart';
import 'package:flutter_app/components/botton.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsPage extends StatefulWidget {
  final String getter;
  ProductsPage({required this.getter});

  @override
  State<ProductsPage> createState() => ProductsPageState();
}

class ProductsPageState extends State<ProductsPage> {
  List<Food> _products = [];

//RICHIESTA DEI PIATTI AL DB
  Future<void> getProductsFromServer() async {
    var response = await http.get(Uri.parse('$localhost${widget.getter}'));
    if (response.statusCode == 200) {
      var jsonList = json.decode(response.body) as List<dynamic>;
      print(indexState);
      print(bo);
      // BLOCCO PER IL CURRENT INDEX
      if (indexState != 5 && bo == true) {
        setState(() {
          _products = jsonList.map((json) => Food.fromJson(json)).toList();
          bo = false;
        });
      }
    } else {
      throw Exception('Failed to load food');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductsList();
  }

  Widget _buildProductsList() {
    getProductsFromServer();
    if (_products.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return BottomAdd(name: product.name);
        },
      );
    }
  }
}
