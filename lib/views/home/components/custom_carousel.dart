import 'package:flutter/material.dart';
import 'package:parcial2/models/productModel.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../details/details_screen.dart';
import 'product_card.dart';

/// ## CustomCarousel()
/// ___
/// @param `data: List<Product>`
/// 
/// @returns `CarouselSlider` que contiene Widgets de tipo `ProductCard`
CarouselSlider CustomCarousel(List<Product> data, context){

  return CarouselSlider(
    
    options: CarouselOptions(
      height: 330,
      viewportFraction: 0.5,
    ),

    items: data.map((product) {
      return Builder( builder: (BuildContext context) {
          return ProductCard(
            title: product.title,
            category: product.category,
            image: product.imageUrl,
            price: product.price,
            marginOff: false,
            press: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(data: product)));
            },
          );
        },
      );
    }
  ).toList(growable: true),);
}


/// ## CustomListView()
/// ___
/// @param `data: List<Product>`
/// 
/// @returns `products: List<Widget>` un array de Widgets de tipo `ProductCard`
List<Widget> CustomListView(List<Product> data, context){
  List<Widget> products = [];
  for(var product in data){
    print("data: ${data.length}");
    products.add(
      ProductCard(
          title: product.title,
          category: product.category,
          image: product.imageUrl,
          price: product.price,
          marginOff: true,
          press: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(data: product)));
          },
      )
    );
  } 
  return products;
}

/// ## GenerateFutureData()
/// ___
/// @param `data: List<Product>`
/// 
/// @returns `FutureBuilder` construye un SolverGrid con Widgets de tipo `ProductCard` con la data enviada por parametro
/// 
// ignore: non_constant_identifier_names
Widget GenerateFutureData(data){
  return FutureBuilder(
    future: data,
    builder: (context, snapshot){

      if(snapshot.hasData){
        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 0.5,
            crossAxisSpacing: 0.0,
            childAspectRatio: 0.7,
          ),
          delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomListView(snapshot.data as List<Product>,context)[index],
              );
            },
            childCount:CustomListView(snapshot.data as List<Product>,context).length,
          ),
        );
        
      }else{
        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index){
                return const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                );
              }
          ),

        );
      }
    },
  );
}