import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LogoAndName(),
    );
  }
}

class LogoAndName extends StatefulWidget {
  @override
  _LogoAndNameState createState() => _LogoAndNameState();
}

class _LogoAndNameState extends State<LogoAndName> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //   Duration(seconds: 3),
    //   () => Navigator.pushReplacement(
    //     context,
    //     PageRouteBuilder(
    //       // fullscreenDialog: true,
    //     //  barrierColor: blue1,
    //       transitionDuration: Duration(seconds: 3),
    //       pageBuilder: (_, __, ___) => Yonlendirme(),
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          //    color: blue1,
          image: DecorationImage(
            image: AssetImage('assets/images/karşılamaEkranıBG.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.2),
            Image.asset(
              "assets/images/geciciLogo.png",
              width: size.width / 2,
            ),
            Spacer(),
            SizedBox(height: size.height * 0.2),
          ],
        ),
      ),
    );
  }
}
