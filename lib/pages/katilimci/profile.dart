import 'package:flutter/material.dart';

class KatilimciProfili extends StatefulWidget {
  @override
  _KatilimciProfili createState() => _KatilimciProfili();
}

class _KatilimciProfili extends State<KatilimciProfili> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          editButton(s),
          centerOfPage(s),
          SizedBox(
            height: s.height * 0.1,
          )
        ],
      ),
    );
  }

  centerOfPage(Size s) {
    return Container(
      height: s.height * 0.6,
      width: s.width,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: s.height * 0.5,
              width: s.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey[600],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  userDatas(s),
                  Container(
                    height: s.height * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        userStatics(s),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          photoOfUser(),
        ],
      ),
    );
  }

  photoOfUser() {
    return Positioned(
      left: 5,
      child: CircleAvatar(
        radius: 80,
        backgroundColor: Colors.pink,
      ),
    );
  }

  userStatics(Size s) {
    return Column(
      children: [
        Text("Aktif Proje Sayısı: 4"),
        Text("Tamamlanan Proje Sayısı: 4"),
        Text("Etki Edilen Öğrenci Sayısı: 4"),
      ],
    );
  }

  userDatas(Size s) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: s.width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [Text("Tahir Uzelli"), Text("Gönüllü")],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  editButton(Size s) {
    return Container(
      width: s.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
