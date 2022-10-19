import 'package:flutter/material.dart';
import 'package:parcial2/views/details/components/body.dart';

import '../../models/productModel.dart';

class DetailsScreen extends StatelessWidget {
  
  const DetailsScreen({ 
    Key? key,
    required this.data
  }) : super(key: key);

  final Product data;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Body(data: data)
    );
  }
}