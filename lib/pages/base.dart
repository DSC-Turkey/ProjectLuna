import 'package:Luna/pages/gonullu/kesfet.dart';
import 'package:Luna/pages/gonullu/profile.dart';
import 'package:Luna/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';

import 'gonullu/homePage.dart';

class Base extends StatefulWidget {
  @override
  _Base createState() => _Base();
}

class _Base extends State<Base> {
  int _currentIndex = 0;
  List<Widget> pages = [
    GonulluKesfetPage(),
    GonulluHomePage(),
    GonulluProfil(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text("")),
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text("")),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
        body: pages[_currentIndex],
      ),
    );
  }
}
