import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/productModel.dart';
import 'preview_image.dart';
import 'product_detail.dart';

class Body extends StatelessWidget {
  
  /// ## Body()
  /// Stateful Widget el cual devuelve un SingleChildScrollView que contiene el cuerpo de la vista
  const Body({ 
    Key? key,
    required this.data
  }) : super(key: key);


  final Product data;
  
  @override
  Widget build(BuildContext context){

    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(

      child: Column(
        children: [

          // Imagen Ampliada
          PreviewImage(image: data.imageUrl),

          // Detalle del producto
          ProductDetail(
            title: data.title, 
            category: data.category, 
            price: data.price, 
            largeTitle: data.large_title, 
            largeCategory: data.large_category,
          ),

          const SizedBox(height: kDefaultPadding),
          Row(
            children: [

              // Boton de Comprar
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: TextButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: kSecondaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20)
                      ),
                    ),
                  ),
                  child: const Text(
                    "Buy Now", 
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                
              ),

              // Botón de descripcion
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: TextButton(
                  onPressed: (){},
                  child: const Text("Description"),
                )
              )
            ],
          )
        ],
      ),
    );
  }
}





