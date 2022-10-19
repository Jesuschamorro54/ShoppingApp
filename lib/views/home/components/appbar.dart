import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parcial2/constants.dart';

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: kPrimaryColor,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"), onPressed: (){},
    ),
  );
}

