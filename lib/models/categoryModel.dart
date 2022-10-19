import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parcial2/models/productModel.dart';

// GENERADOR DE LA DATA
class CategorryDataGenerate {
  
  List<Category> categories = [
    Category.fromJsonMap({'name': 'Electronics', 'icon': Icons.power}),
    Category.fromJsonMap({'name': 'Jewelery', 'icon': Icons.diamond}),
    Category.fromJsonMap({'name': "Men's clothing", 'icon': Icons.man,}),
    Category.fromJsonMap({'name': "Women's clothing", 'icon': Icons.woman}),
  ];
  
}

// MODELO
class Category{
  late String name;
  late IconData icon;

  Category();

  Category.fromJsonMap(Map<String, dynamic> json){
    name = json['name'];
    icon = json['icon'];
  }
}