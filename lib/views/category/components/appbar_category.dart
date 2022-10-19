import 'package:flutter/material.dart';
import 'package:parcial2/constants.dart';

class AppBarCategory extends StatelessWidget {
  const AppBarCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding * 2.5),
      height: size.height * 0.2,
      child: Stack(
        children: <Widget> [
          Container(
            padding: const EdgeInsets.only(
              left: kDefaultPadding, 
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding
            ),
            height: size.height * 0.2 -27,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              )
            ),

            // Nombre de la app
            child: Row(
              children: [
                Text(
                  "[Nombre de la catyegoria]", 
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold
                  )
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}