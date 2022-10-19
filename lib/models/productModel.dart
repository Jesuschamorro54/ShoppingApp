import 'package:characters/characters.dart';

// ignore_for_file: file_names

// GENERADOR DE LA DATA
class ProductDataGenerate{

  // Array donde voy a guardar la info de los pkemones {name, imgUrl}
  List<Product> items = [];

  ProductDataGenerate();


  // Esta funcion espera recibir el json de un pokemon en especifico
  setItems(List json){
    // ignore: unnecessary_null_comparison
    if(json == null) return {};
    
    for( var item in json){
      final product = Product.fromJsonMap(item);
      items.add(product);      
    } 
  }
}
// MODELO
class Product {
  late String title;
  late String large_title;
  late String imageUrl;
  late String category;
  late String large_category;
  late double price;

  Product();

  Product.fromJsonMap(Map<String, dynamic> json){
    large_title = json["title"];
    title = "${json["title"].toString().characters.take(7).toLowerCase()}..." ;
    imageUrl = json["image"];
    large_category = json["category"];
    category = "${json["category"].toString().characters.take(13).toLowerCase()}...";
    price = json["price"] + 0.0;
  }
}