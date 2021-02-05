import 'package:Luna/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';

class Base extends StatefulWidget{
  @override
  _Base createState()=>_Base();
}

class _Base extends State<Base>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavBarV2(),
    );
  }
  
}