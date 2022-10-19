import 'package:flutter/material.dart';
import 'package:parcial2/constants.dart';
import 'package:parcial2/views/home/components/body.dart';

import 'components/appbar.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      backgroundColor: kBackgroundColor,
      appBar: CustomAppBar(),
      body: const MyBody(),
      
    );
  }
}