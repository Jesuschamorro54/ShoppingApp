import 'package:flutter/material.dart';
import 'package:parcial2/constants.dart';

class TittleWithBtn extends StatelessWidget {

  /// ## TittleWithBtn()
  /// Widget que contiene el titulo y el botón de una sección de la app
  /// ___
  /// @param `title: String` Titulo de la sección
  /// 
  /// @param `press: Funtion` Funcion que ejecutará el botón
  /// 
  /// @returns Padding que contiene un Row con los elementos

  const TittleWithBtn({
    Key? key, 
    required this.title, 
    required this.press,
    
  }) : super(key: key);

  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(

        children: [
          
          TittleWithCustomUnderline(text: title,),
          const Spacer(),
          TextButton(

            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: kSecondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: press(), 
            child: const Text("Ver más", style: TextStyle(color: Colors.white))
          )
        ],
      ),
    );

  }
}

class TittleWithCustomUnderline extends StatelessWidget {
  
  /// ## TittleWithCustomUnderline()
  /// ___
  /// @param `text: String`
  /// 
  /// @returns SizedBox que el texto
  const TittleWithCustomUnderline({
    Key? key, 
    required this.text
  }) : super(key: key);

  final String text; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: 24,
      child: Stack(

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding/4),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 7,
              margin: const EdgeInsets.only(right: kDefaultPadding/4),
            ),
          )
        ],
      ),
    );

  }
}