import 'package:flutter/material.dart';
import 'package:parcial2/models/productModel.dart';
import 'package:parcial2/views/details/details_screen.dart';

import '../../../providers/dataProvider.dart';
import 'categories.dart';
import 'custom_carousel.dart';
import 'header_with_search.dart';
import 'tittle_with_btn.dart';


class MyBody extends StatefulWidget{
  const MyBody({Key? key}): super(key: key);


  @override
  State<MyBody> createState() => _BodyState();
}

class _BodyState extends State<MyBody> {

  late Future<List<Product>> productList;

  @override
  void initState() {
    super.initState();

    final dataProvider = ProductProvider();
    productList = dataProvider.getProducts('products');


  }

  @override
  Widget build(BuildContext context){

    Size size = MediaQuery.of(context).size;

    // Se pone un scroll para dispositivos pequeños
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          // HEADER DEL HOME
          HearderWithSearchBox(size: size),

          // SECCIÓN DE PRODUCTOS RECOMENDADOS
          TittleWithBtn(title: "Productos Recomendados", press: () {}),

          FutureBuilder<Object>(
            future: productList,
            builder: (context, snapshot){
              if (snapshot.hasData){
                
                return SingleChildScrollView(
                  
                  child: CustomCarousel(snapshot.data as List<Product>, context)
                );

              }else{
                print(snapshot.error);
                // ignore: prefer_const_constructors
                return Center(
                  child: const CircularProgressIndicator(),
                );
              }
            }
          ),
          
          CategoryList()

        ],
      ),
    );
  }
}


