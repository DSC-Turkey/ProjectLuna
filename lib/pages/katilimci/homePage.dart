import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class KatilimciHomePage extends StatefulWidget {
  @override
  _KatilimciHomePage createState() => _KatilimciHomePage();
}

class _KatilimciHomePage extends State<KatilimciHomePage> {
  List images = [
    "https://www.idecad.com.tr/images/icerik/9.jpg",
    "https://www.mesa.com.tr/img/gelecekprojelerImg.png",
    "https://chainpm.com/uploads/uygulama-projesi-ve-kesin-proje-arasindaki-farklar-5d381b65bb0e8.png",
  ];
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          carouselSlider(s),
          activeProjects(s),
        ],
      ),
    );
  }

  activeProjects(Size s) {
    return Container(
      height: s.height * 0.5,
      width: s.width,
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(10, (index) {
          return item(s);
        }),
      ),
    );
  }

  item(Size s) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.black,
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
