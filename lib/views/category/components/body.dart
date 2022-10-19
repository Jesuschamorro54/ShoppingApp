import 'package:flutter/material.dart';
import 'package:parcial2/views/category/components/appbar_category.dart';
import '../../../constants.dart';
import '../../../models/productModel.dart';
import '../../../providers/dataProvider.dart';
import '../../home/components/custom_carousel.dart';

class Body extends StatefulWidget {
  
  const Body({ 
    Key? key,
    required this.category_id, 
    required this.icon
  }) : super(key: key);


  final String category_id;
  final IconData icon;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  late Future<List<Product>> productList;

  @override
  void initState() {
    super.initState();

    final dataProvider = ProductProvider();
    productList = dataProvider.getProducts('products/category/${widget.category_id}');
  }

  @override
  Widget build(BuildContext context){


    Size size = MediaQuery.of(context).size;

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: kPrimaryColor,
          pinned: true,
          expandedHeight: 100.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(widget.category_id.toUpperCase())
          ),
        ),

        GenerateFutureData(productList)

        // SliverGrid(
        //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //     maxCrossAxisExtent: 200.0,
        //     mainAxisSpacing: 10.0,
        //     crossAxisSpacing: 10.0,
        //     childAspectRatio: 1.0,
        //   ),
        //   delegate: SliverChildBuilderDelegate(
        //     (BuildContext context, int index) {
        //       return Container(
        //         alignment: Alignment.center,
        //         color: Colors.teal[100 * (index % 9)],
        //         child: Text('Grid Item $index'),
        //       );
        //     },
        //     childCount: 20,
        //   ),
        // ),
      ],
      
    );
  }

  
}





