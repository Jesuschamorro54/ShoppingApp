// ignore_for_file: library_private_types_in_public_api

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:parcial2/constants.dart';
import 'package:parcial2/models/categoryModel.dart';
import 'package:parcial2/views/category/category_screen.dart';
import 'package:parcial2/views/home/components/tittle_with_btn.dart';

class CategoryList extends StatefulWidget {
  
  /// ## CategoryList()
  /// ___
  /// @returns `SingleChildScrollView` con dirección horizontal que contiene las categorias
  const CategoryList({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _CategoryListState createState() => _CategoryListState();

}

class _CategoryListState extends State<CategoryList> {

  List<Category> categories = CategorryDataGenerate().categories;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
          
      padding: const EdgeInsets.only(
        left: kDefaultPadding / 2, 
        right: kDefaultPadding / 2,
      ),
      child: Column(
        children: [
          TittleWithBtn(title: "Categorias", press: () {}),

          const SizedBox(height: 5),

          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [

                    // Category Card
                    GestureDetector(
                      onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(category_id:categories[index].name.toLowerCase(), icon: categories[index].icon,))); },
                      child: Container(
                        width: 180,
                        height: 60,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: kSecondaryColor)
                        ),

                        // Nombre E icono de la categoria
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Icon(categories[index].icon),

                            const SizedBox(width: 3),

                            Text(
                              categories[index].name,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                            )
                            
                          ],
                        ),
                      ),
                    ),                          
                  ],
                );
              }
            ),
          ),
        ]
      ),
    );
  }
}