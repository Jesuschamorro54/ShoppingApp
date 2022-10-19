import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/productModel.dart';

class  ProductProvider{

  final defaultUrl = "https://fakestoreapi.com/";


  Future<List<Product>> getProducts(String url) async{
    print("| Executing API request |");

    // Consulto la URL que devuelve todos los Productos {name, url}
    final res = await http.get(Uri.parse(defaultUrl+url));

    if(res.statusCode == 200){

      print("| Sucessful response from API |");

      String body;
      final productsObject = ProductDataGenerate();
      final jsonData;

      body = utf8.decode(res.bodyBytes);
      jsonData = jsonDecode(body);
      productsObject.setItems(jsonData);
      
      return productsObject.items;
  
    }else{
      print("Error al consultar");

      throw Exception("Ocurrio Algo ${res.statusCode}");

    }
  }


}