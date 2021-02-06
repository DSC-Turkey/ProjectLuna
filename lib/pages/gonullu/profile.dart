import 'package:flutter/material.dart';

class GonulluProfil extends StatefulWidget {
  @override
  _GonulluProfil createState() => _GonulluProfil();
}

class _GonulluProfil extends State<GonulluProfil> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          editButton(s),
          centerOfPage(s),
        ],
      ),
    );
  }

  centerOfPage(Size s) {
    return Container(
      height: s.height * 0.8,
      width: s.width,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: s.height * 0.75,
              width: s.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFE46467),
                border: Border.all(
                  color: Colors.grey[600],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  userDatas(s),
                  Container(
                    height: s.height * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        userStatics(s),
                        buttons(s),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          photoOfUser(s),
          badget(s),
        ],
      ),
    );
  }

  badget(Size s) {
    return Positioned(
      left: s.height * 0.055,
      top: s.height * 0.12,
      child: Container(
        height: s.height * 0.05,
        width: s.height * 0.05,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF2F4F6),
          border: Border.all(
            color: Color(0xFFE46467),
          ),
        ),
        child: Image.network(
            "https://cdn.pixabay.com/photo/2020/07/07/06/04/award-5379357_960_720.png"),
      ),
    );
  }

  photoOfUser(Size s) {
    return Positioned(
      left: 5,
      child: Container(
        height: s.height * 0.15,
        width: s.height * 0.15,
        decoration: BoxDecoration(
          color: Color(0xFFDF5E63),
          shape: BoxShape.circle,
        ),
        child: Image.network(
            "https://icons-for-free.com/iconfiles/png/512/girl+lady+woman+icon-1320166689851732796.png"),
      ),
    );
  }

  buttons(Size s) {
    return Container(
      width: s.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF2F4F6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16),
                child: Text("Aktif Projeleri Göster"),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF2F4F6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16),
                child: Text("Aktif Projeleri Göster"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  userStatics(Size s) {
    return Container(
      height: s.height * 0.4,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Aktif Proje Sayısı: 4",
              style: textStyle(
                22,
                Colors.grey[100],
              ),
            ),
            Text(
              "Tamamlanan Proje Sayısı: 4",
              style: textStyle(
                22,
                Colors.grey[100],
              ),
            ),
            Text(
              "Etki Edilen Öğrenci Sayısı: 4",
              style: textStyle(
                22,
                Colors.grey[100],
              ),
            ),
            Text(
              "Toplam Ders Sayısı: 4",
              style: textStyle(
                22,
                Colors.grey[100],
              ),
            ),
          ],
        ),
      ),
    );
  }

  textStyle(double size, Color color) {
    return TextStyle(color: color, fontSize: size);
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
              height: s.height * 0.1,
              width: s.width * 0.4,
              decoration: BoxDecoration(
                  color: Color(0xFFF2F4F6),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Tahir Uzelli",
                      style: textStyle(25, Colors.grey[500]),
                    ),
                    Text(
                      "Gönüllü",
                      style: textStyle(22, Colors.grey[500]),
                    ),
                  ],
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
