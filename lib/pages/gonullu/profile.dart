import 'package:Luna/pages/gonullu/createProject.dart';
import 'package:flutter/material.dart';

class GonulluProfil extends StatefulWidget {
  @override
  _GonulluProfil createState() => _GonulluProfil();
}

class _GonulluProfil extends State<GonulluProfil> {
  bool toggleValue = true;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          languegeSelector(),
          centerOfPage(s),
        ],
      ),
    );
  }

  languegeSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        toggleValue ? Text("EN") : Text("TR"),
        Text(
          "  |",
          style: textStyle(20, Colors.grey),
        ),
        Switch(
          value: toggleValue,
          onChanged: (value) {
            setState(() {
              toggleValue = !toggleValue;
            });
          },
          activeTrackColor: Color(0xFF596ee1),
          activeColor: Colors.white,
        ),
      ],
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
                color: Color(0xFFF49C42),
                border: Border.all(
                  color: Colors.grey[600],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  userDatas(s),
                  editMyProfileButton(),
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

  editMyProfileButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.grey[700],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              "Profili Düzenle",
              style: textStyle(20, Colors.white),
            ),
          ),
        ),
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
            width: 2,
            color: Color(0xFFF49C42),
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
          color: Colors.white,
          border: Border.all(color: Color(0xFFF49C42), width: 2),
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
      height: s.height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateProject()));
            },
            child: Container(
              width: s.width * 0.8,
              decoration: BoxDecoration(
                color: Color(0xFFF2F4F6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16),
                child: Center(
                  child: Text(
                    "Proje Oluştur",
                    style: textStyle(
                      30,
                      Colors.grey[800],
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              width: s.width * 0.8,
              decoration: BoxDecoration(
                color: Color(0xFFF2F4F6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16),
                child: Center(
                  child: Text(
                    "Projeler",
                    style: textStyle(
                      30,
                      Colors.grey[800],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  userStatics(Size s) {
    return Container(
      height: s.height * 0.35,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: s.height * 0.1,
              width: s.width * 0.4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Tahir Uzelli",
                      style: textStyle(28, Colors.white),
                    ),
                    Text(
                      "Gönüllü",
                      style: textStyle(25, Colors.white),
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
}
