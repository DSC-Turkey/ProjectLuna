import 'package:Luna/pages/katilimci/homePage.dart';
import 'package:Luna/pages/katilimci/kesfet.dart';
import 'package:Luna/pages/katilimci/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class KatilimciBase extends StatefulWidget {
  @override
  _Base createState() => _Base();
}

class _Base extends State<KatilimciBase> {
  int _currentIndex = 0;
  List<Widget> pages = [
    KatilimciKesfetPage(),
    KatilimciHomePage(),
    KatilimciProfil(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      color: Colors.purple,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          bottomNavigationBar: Container(
            height: s.height * 0.08,
            width: s.width,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 5,
                          color: _currentIndex == 0
                              ? Color(0xFFef807e)
                              : Colors.white,
                        ),
                      ),
                    ),
                    width: s.width * 0.09,
                    child: Image.asset(
                      "assets/icons/navbar/Keşfet.png",
                      color: Color(0xFFef807e),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 5,
                          color: _currentIndex == 1
                              ? Color(0xFFef807e)
                              : Colors.white,
                        ),
                      ),
                    ),
                    width: s.width * 0.12,
                    child: SvgPicture.asset(
                      "assets/icons/navbar/home.svg",
                      color: Color(0xFFef807e),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 5,
                          color: _currentIndex == 2
                              ? Color(0xFFef807e)
                              : Colors.white,
                        ),
                      ),
                    ),
                    width: s.width * 0.09,
                    child: SvgPicture.asset(
                      "assets/icons/navbar/user.svg",
                      color: Color(0xFFef807e),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //   items: [
          //     BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text("")),
          //     BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
          //     BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text("")),
          //   ],
          //   currentIndex: _currentIndex,
          //   onTap: _onItemTapped,
          // ),
          body: pages[_currentIndex],
        ),
      ),
    );
  }
}
