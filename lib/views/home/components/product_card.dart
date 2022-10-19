import 'package:flutter/material.dart';
import 'package:parcial2/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key, 
    required this.image, 
    required this.title, 
    required this.category, 
    required this.price, required this.press, required this.marginOff, 

  }) : super(key: key);

  final String image, title, category;
  final double price;
  final Function press;
  final bool marginOff;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return Container(
      width: size.width * 0.5,
      // height: 300,
      margin: marginOff ?
      const EdgeInsets.all(0)
      :const EdgeInsets.only(
        left: kDefaultPadding, 
        top: kDefaultPadding/2, 
        bottom: kDefaultPadding
      ),
      child: Column(
        children: [
          
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.network(
              image, 
              height: 200, 
              width: size.width * 0.5, 
              fit:BoxFit.fill
            ),
          ),
          
          GestureDetector(
            onTap: () => press(),
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.5) ,
                  )
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )
              ),
          
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title \n", 
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: category,
                          style: TextStyle(color: kSecondaryColor.withOpacity(0.5), ),
          
                        )
                      ]
                    )
                  ),
                  Spacer(),
                  Text(
                    "\$ $price", 
                    style: Theme.of(context)
                    .textTheme
                    .button
                    ?.copyWith(color: Colors.green),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}