import 'package:flutter/material.dart';
import 'package:parcial2/constants.dart';


class ProductDetail extends StatelessWidget {
  
  const ProductDetail({
    Key? key, 
    required this.title, 
    required this.category, 
    required this.price, 
    required this.largeTitle,
    required this.largeCategory,
  }) : super(key: key);

  final String title, largeTitle, category, largeCategory;
  final double price;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          Container(
            width: size.width * 0.6,
            child: Flexible(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$largeTitle\n",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: kTextColor, fontWeight: FontWeight.bold
                      )
                    ),
            
                    TextSpan(
                      text: largeCategory,
                      style: const TextStyle(
                        fontSize: 17,
                        color: kSecondaryColor,
                        fontWeight: FontWeight.w400,
                      )
                    )
                  ]
                )
              ),
            ),
          ),
          Spacer(),

          Text(
            "\$$price USD",
            style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(color: kSecondaryColor),
          )
        ],
      ),
    );
  }
}