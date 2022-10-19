import 'package:flutter/material.dart';
import 'components/body.dart';


class CategoryScreen extends StatelessWidget {
  
  const CategoryScreen({ 
    Key? key,
    required this.category_id, 
    required this.icon
  }) : super(key: key);

  final String category_id;
  final IconData icon;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Body(category_id: category_id, icon: icon,)
    );
  }
}