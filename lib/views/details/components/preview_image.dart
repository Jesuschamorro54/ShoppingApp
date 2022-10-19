import 'package:flutter/material.dart';
import 'package:parcial2/constants.dart';

import 'icon_card.dart';

class PreviewImage extends StatelessWidget {
  
  const PreviewImage({
    
    Key? key, 
    required this.image,

  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 0.1),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding*2),
                child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          icon: Icon( Icons.arrow_back),
                      
                          onPressed: () => Navigator.pop(context), 
                        ),
                      ),

                      const Spacer(),
    
                      const IconCard(icon: Icons.favorite),
                      const IconCard(icon: Icons.thumb_up),
                      const IconCard(icon: Icons.visibility),
                      const IconCard(icon: Icons.recommend),
    
                    ],
                ),
              )
            ),
      
            // Imagen ampliada
            Container(
              height:  size.height*0.6,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50)
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 60,
                    color: kPrimaryColor.withOpacity(0.29),
                  )
                ],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.fill,
                  image: NetworkImage(image)
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}