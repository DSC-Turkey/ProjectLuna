import 'package:Luna/Constants/colors.dart';
import 'package:Luna/Widgets/projectCard.dart';
import 'package:Luna/pages/projectDetail.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class KatilimciHomePage extends StatefulWidget {
  @override
  _KatilimciHomePage createState() => _KatilimciHomePage();
}

class _KatilimciHomePage extends State<KatilimciHomePage> {
  AnimationController _controller;
  Animation<double> _animation;
  List images = [
    "assets/images/Anasayfa görsel.png",
    "assets/images/Proje Adı Görsel.png",
  ];

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          carouselSlider(s),
          activeProjects(s),
          //createProject(s),
        ],
      ),
    );
  }

  activeProjects(Size s) {
    Map map = {
      "duration": "54",
      "pName": "MMW",
      "gName": "melikhan",
      "pAlani": "Sağlık",
      "lang": "TR",
      "startDate": "1 Mart"
    };
    return Container(
      height: s.height * 0.6,
      width: s.width,
      child: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return ProjectCard(s, colors[index % 4], subColors[index % 4],
              parametrCard[index % 4], parametrAppBar[index % 4], map);
        },
      ),
    );
  }

  carouselPage(String imageUrl) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      //margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  carouselSlider(var size) {
    return Container(
      height: size.height / 4,
      child: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          CarouselSlider(
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: [
              for (int i = 0; i < images.length; i++)
                carouselPage(
                  images[i],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    // rotate the canvas
    final degrees = 15;
    final radians = degrees * math.pi / 180;
    canvas.rotate(radians);
    // draw the text
    final textStyle = TextStyle(color: Colors.black, fontSize: 30);
    final textSpan = TextSpan(text: 'Hello, world.', style: textStyle);
    TextPainter(text: textSpan, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: size.width)
      ..paint(canvas, Offset(0, 0));
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
