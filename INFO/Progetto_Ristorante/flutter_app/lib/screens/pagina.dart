import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/food.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/components/botton.dart';

class ProductsPage extends StatefulWidget {
  final String getter;
  ProductsPage({required this.getter});

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Food> _products = [];

  Future<void> _getProductsFromServer() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:4000${widget.getter}'));
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List<dynamic>;
      setState(() {
        _products = jsonList.map((json) => Food.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load food');
    }
  }

  @override
  void initState() {
    super.initState();
    _getProductsFromServer();
    
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductsList();
  }

  Widget _buildProductsList() {
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
