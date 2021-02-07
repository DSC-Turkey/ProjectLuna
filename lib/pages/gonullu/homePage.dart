import 'dart:math' as math;

import 'package:Luna/Enterence/Login.dart';
import 'package:Luna/pages/projectDetail.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class GonulluHomePage extends StatefulWidget {
  @override
  _GonulluHomePage createState() => _GonulluHomePage();
}

class _GonulluHomePage extends State<GonulluHomePage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  List images = [
    "assets/images/Anasayfa görsel.png"
        "assets/images/Proje Adı Görsel.png"
  ];
  List<BoxDecoration> colors = [
    BoxDecoration(
      borderRadius: BorderRadius.circular(5.54),
      gradient: LinearGradient(
        begin: Alignment(1.0, 0.0),
        end: Alignment(-1.0, 0.0),
        colors: [
          const Color(0xffef807e),
          const Color(0xffe06b72),
          const Color(0xffd45968)
        ],
        stops: [0.0, 0.572, 1.0],
      ),
    ),
    BoxDecoration(
      borderRadius: BorderRadius.circular(5.54),
      gradient: LinearGradient(
        begin: Alignment(1.0, 0.0),
        end: Alignment(-1.0, 0.0),
        colors: [
          const Color(0xff8a84be),
          const Color(0xff7a6fb0),
          const Color(0xff6958a1)
        ],
        stops: [0.0, 0.514, 1.0],
      ),
    ),
    BoxDecoration(
      borderRadius: BorderRadius.circular(5.54),
      gradient: LinearGradient(
        begin: Alignment(1.0, 0.0),
        end: Alignment(-1.0, 0.0),
        colors: [
          const Color(0xff6088b0),
          const Color(0xff54789b),
          const Color(0xff405b75)
        ],
        stops: [0.0, 0.399, 1.0],
      ),
    ),
    BoxDecoration(
      borderRadius: BorderRadius.circular(5.54),
      gradient: LinearGradient(
        begin: Alignment(1.0, 0.0),
        end: Alignment(-1.0, 0.0),
        colors: [
          const Color(0xfffabd5e),
          const Color(0xfff7b053),
          const Color(0xfff49d42),
          const Color(0xfff3963d)
        ],
        stops: [0.0, 0.232, 0.687, 1.0],
      ),
    ),
  ];
  List<BoxDecoration> parametrCard = [
    BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      gradient: LinearGradient(
        begin: Alignment(1.0, 0.0),
        end: Alignment(-1.0, 0.0),
        colors: [
          const Color(0xffef807e),
          const Color(0xffe06b72),
          const Color(0xffd45968)
        ],
        stops: [0.0, 0.572, 1.0],
      ),
    ),
    BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      gradient: LinearGradient(
        begin: Alignment(1.0, 0.0),
        end: Alignment(-1.0, 0.0),
        colors: [
          const Color(0xff8a84be),
          const Color(0xff7a6fb0),
          const Color(0xff6958a1)
        ],
        stops: [0.0, 0.514, 1.0],
      ),
    ),
    BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      gradient: LinearGradient(
        begin: Alignment(1.0, 0.0),
        end: Alignment(-1.0, 0.0),
        colors: [
          const Color(0xff6088b0),
          const Color(0xff54789b),
          const Color(0xff405b75)
        ],
        stops: [0.0, 0.399, 1.0],
      ),
    ),
    BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      gradient: LinearGradient(
        begin: Alignment(1.0, 0.0),
        end: Alignment(-1.0, 0.0),
        colors: [
          const Color(0xfffabd5e),
          const Color(0xfff7b053),
          const Color(0xfff49d42),
          const Color(0xfff3963d)
        ],
        stops: [0.0, 0.232, 0.687, 1.0],
      ),
    ),
  ];
  List<BoxDecoration> parametrAppBar = [
    BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(1.0, 0.0),
        end: Alignment(-1.0, 0.0),
        colors: [
          const Color(0xffef807e),
          const Color(0xffe06b72),
          const Color(0xffd45968)
        ],
        stops: [0.0, 0.572, 1.0],
      ),
    ),
    BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(1.0, 0.0),
        end: Alignment(-1.0, 0.0),
        colors: [
          const Color(0xff8a84be),
          const Color(0xff7a6fb0),
          const Color(0xff6958a1)
        ],
        stops: [0.0, 0.514, 1.0],
      ),
    ),
    BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(1.0, 0.0),
        end: Alignment(-1.0, 0.0),
        colors: [
          const Color(0xff6088b0),
          const Color(0xff54789b),
          const Color(0xff405b75)
        ],
        stops: [0.0, 0.399, 1.0],
      ),
    ),
    BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment(1.0, 0.0),
        end: Alignment(-1.0, 0.0),
        colors: [
          const Color(0xfffabd5e),
          const Color(0xfff7b053),
          const Color(0xfff49d42),
          const Color(0xfff3963d)
        ],
        stops: [0.0, 0.232, 0.687, 1.0],
      ),
    ),
  ];
  List<BoxDecoration> subColors = [
    BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment(1.0, 0.0),
        end: Alignment(-1.0, 0.0),
        colors: [
          const Color(0xffef807e),
          const Color(0xffe06b72),
          const Color(0xffd45968)
        ],
        stops: [0.0, 0.572, 1.0],
      ),
    ),
    BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.0, 0.0),
          end: Alignment(-1.0, 0.0),
          colors: [
            const Color(0xff8a84be),
            const Color(0xff7a6fb0),
            const Color(0xff6958a1)
          ],
          stops: [0.0, 0.514, 1.0],
        ),
        shape: BoxShape.circle),
    BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.0, 0.0),
          end: Alignment(-1.0, 0.0),
          colors: [
            const Color(0xff6088b0),
            const Color(0xff54789b),
            const Color(0xff405b75)
          ],
          stops: [0.0, 0.399, 1.0],
        ),
        shape: BoxShape.circle),
    BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.0, 0.0),
          end: Alignment(-1.0, 0.0),
          colors: [
            const Color(0xfffabd5e),
            const Color(0xfff7b053),
            const Color(0xfff49d42),
            const Color(0xfff3963d)
          ],
          stops: [0.0, 0.232, 0.687, 1.0],
        ),
        shape: BoxShape.circle),
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

  createProject(Size s) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.pink[100],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Proje Oluştur"),
          ),
        ),
      ),
    );
  }

  activeProjects(Size s) {
    return Container(
      height: s.height * 0.6,
      width: s.width,
      child: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return item(s, colors[index % 4], subColors[index % 4],
              parametrCard[index % 4], parametrAppBar[index % 4]);
        },
      ),
    );
  }

  item(Size s, BoxDecoration color, BoxDecoration subColor,
      BoxDecoration parametr, BoxDecoration appBar) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProjectDetail(parametr, appBar)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height: s.height * .18,
          child: Stack(
            children: [
              middleOfCard(s, color),
              userPhoto(s, subColor),
              note(s),
            ],
          ),
        ),
      ),
    );
  }

  note(Size s) {
    return Positioned(
      right: 0,
      top: -5,
      child: Stack(
        children: [
          Container(
            height: s.height * 0.1,
            width: s.height * 0.1,
            child: Image.asset(
              "assets/images/Sarı Takvim.png",
            ),
          ),
          Positioned(
            top: s.height * 0.041,
            left: 20,
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.rotationZ(0.65),
              child: Text("1 Mart"),
            ),
          )
        ],
      ),
    );
  }

  middleOfCard(Size s, BoxDecoration color) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: s.width * 0.8,
        height: s.height * 0.14,
        decoration: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(),
              cardDatas(),
            ],
          ),
        ),
      ),
    );
  }

  userPhoto(Size s, BoxDecoration subColor) {
    return Positioned(
      left: 0,
      top: s.height * 0.015,
      child: Container(
        height: s.height * 0.15,
        width: s.height * 0.15,
        decoration: subColor,
        child: Image.network(
            "https://icons-for-free.com/iconfiles/png/512/girl+lady+woman+icon-1320166689851732796.png"),
      ),
    );
  }

  cardDatas() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Proje Adı",
          style: textStyle(25),
        ),
        Text(
          "Gönüllü Adı",
          style: textStyle(22),
        ),
        Text(
          "Proje Alanı | Proje Konusu",
          style: textStyle(22),
        ),
        Row(
          children: [
            Icon(
              Icons.access_time,
              color: Colors.white,
            ),
            Text(
              " 85 | ",
              style: textStyle(20),
            ),
            Icon(
              Icons.language,
              color: Colors.white,
            ),
            Text(
              " TR",
              style: textStyle(20),
            ),
          ],
        ),
      ],
    );
  }

  textStyle(double size) {
    return TextStyle(
      color: Colors.white,
      fontSize: size,
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
