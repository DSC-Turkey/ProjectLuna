import 'package:Luna/pages/gonullu/profile.dart';
import 'package:Luna/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';

class Base extends StatefulWidget {
  @override
  _Base createState() => _Base();
}

class _Base extends State<Base> {
  int _currentIndex = 0;
  List<Widget> pages = [
    GonulluProfil(),
    GonulluProfil(),
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
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: ""),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
        body: pages[_currentIndex],
      ),
    );
  }
}
