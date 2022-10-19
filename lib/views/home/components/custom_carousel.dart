import 'package:flutter/material.dart';
import 'package:parcial2/models/productModel.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../constants.dart';
import '../../details/details_screen.dart';
import 'product_card.dart';

CarouselSlider CustomCarousel(List<Product> data, context){

  List<Widget> products = [];

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
  }).toList(growable: true),);
}

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

Widget GenerateFutureData(data){
  return FutureBuilder( //futurebuilder para cargar las imagenes al grid
    future: data,
    builder: (context, snapshot){
      if(snapshot.hasData){
        return SliverGrid( //SliverGrid coloca cada imagen en una posicion, funciona como un grid solo que este va dentro del Customscrollview
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
                // alignment: Alignment.center,
                child: CustomListView(snapshot.data as List<Product>,context)[index],
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   boxShadow: [
                //     BoxShadow(
                //       offset: Offset(0, 10),
                //       blurRadius: 50,
                //       color: kPrimaryColor.withOpacity(0.5) ,
                //     )
                //   ],
                //   borderRadius: const BorderRadius.only(
                //     bottomLeft: Radius.circular(10),
                //     bottomRight: Radius.circular(10),
                //   )
                // ),
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