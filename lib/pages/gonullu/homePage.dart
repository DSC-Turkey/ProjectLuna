import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class GonulluHomePage extends StatefulWidget {
  @override
  _GonulluHomePage createState() => _GonulluHomePage();
}

class _GonulluHomePage extends State<GonulluHomePage> {
  List images = [
    "https://www.idecad.com.tr/images/icerik/9.jpg",
    "https://www.mesa.com.tr/img/gelecekprojelerImg.png",
    "https://chainpm.com/uploads/uygulama-projesi-ve-kesin-proje-arasindaki-farklar-5d381b65bb0e8.png",
  ];
  List<Color> colors = [
    Color(0xFFDF5E63),
    Color(0xFF8077B6),
    Color(0xFF5B86A9),
  ];
  List<Color> subColors = [
    Color(0xFFE46467),
    Color(0xFF8883BD),
    Color(0xFF5A86AB),
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
              color: Colors.pink[100], borderRadius: BorderRadius.circular(50)),
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
          return item(s, colors[index % 3], subColors[index % 3]);
        },
      ),
    );
  }

  item(Size s, Color color, Color subColor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: s.width * 0.9,
        height: s.height * .15,
        child: Stack(
          children: [
            middleOfCard(s, color),
            userPhoto(s, subColor),
          ],
        ),
      ),
    );
  }

  middleOfCard(Size s, Color color) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: s.width * 0.8,
        height: s.height * 0.13,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
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

  userPhoto(Size s, Color subColor) {
    return Positioned(
      left: 0,
      top: s.height * 0.005,
      child: Container(
        height: s.height * 0.14,
        width: s.height * 0.14,
        decoration: BoxDecoration(
          color: subColor,
          shape: BoxShape.circle,
        ),
        child: Image.network(
            "https://icons-for-free.com/iconfiles/png/512/girl+lady+woman+icon-1320166689851732796.png"),
      ),
    );
  }

  cardDatas() {
    return Column(
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
              "85 | ",
              style: textStyle(20),
            ),
            Icon(
              Icons.airline_seat_individual_suite,
              color: Colors.white,
            ),
            Text(
              "TR",
              style: textStyle(20),
            ),
          ],
        ),
      ],
    );
  }

  textStyle(double size) {
    return TextStyle(color: Colors.white, fontSize: size);
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
          image: NetworkImage(imageUrl),
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
