import 'package:flutter/cupertino.dart';
import 'package:flutter_app/views/view.dart';

//TODO
class Food {
  final String name;
  final String description;


  const Food({
    required this.name,
    required this.description,

  });

  static Food fromJson(json) =>
      Food(name: json['name'], description: json['description']);
}
