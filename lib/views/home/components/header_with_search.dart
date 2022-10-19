import 'package:flutter/material.dart';
import 'package:parcial2/constants.dart';

class HearderWithSearchBox extends StatelessWidget {
  const HearderWithSearchBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
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

            // Nombre de la app con el logo
            child: Row(
              children: [
                Text(
                  "ShopingApp", 
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold
                  )
                ),
                Spacer(),
                Image.asset("assets/images/logo.png")
              ],
            ),
          ),

          // Buscardor
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [ 
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  )
                ]
              ),
              child: TextField(
                // Accion del search
                onChanged: (value){},
                decoration: InputDecoration(
                  hintText: "Search",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: const Icon(Icons.search, color: kSecondaryColor,),
                  hintStyle: TextStyle(
                    color: kPrimaryColor.withOpacity(0.5)
                  )

                ),
              ),
            )
          )
        ],
      )
    );
  }
}