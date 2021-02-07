import 'package:Luna/GetX/FirabaseController.dart';
import 'package:Luna/pages/araci/createProject.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KatilimciProfil extends StatefulWidget {
  @override
  _KatilimciProfil createState() => _KatilimciProfil();
}

class _KatilimciProfil extends State<KatilimciProfil> {
  final controller = Get.put(FirebaseController());
  bool toggleValue = true;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: RaisedButton(
        onPressed: () {
          controller.signout();
        },
        color: Colors.red,
        child: Text(
          "Çıkış yap",
          style: textStyle(
            25,
            Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          languegeSelector(),
          centerOfPage(s),
        ],
      ),
    );
  }

  languegeSelector() {
    return Padding(
      padding: const EdgeInsets.only(right: 32.0),
      child: Transform.scale(
        scale: 2.5,
        child: Switch(
          value: toggleValue,
          onChanged: (bool value) {
            setState(() {
              toggleValue = value;
            });
          },
          inactiveThumbColor: Color(0xfff49d42),
          inactiveTrackColor: Colors.grey[200],
          activeColor: Color(0xfff49d42),
          activeTrackColor: Colors.grey[200],
          activeThumbImage: AssetImage('assets/icons/GUNESS.png'),
          inactiveThumbImage: AssetImage('assets/icons/606795.png'),
        ),
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
              height: s.height * 0.7,
              width: s.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  begin: Alignment(-1.0, 0.0),
                  end: Alignment(1.0, 0.0),
                  colors: [
                    const Color(0xfffabd5e),
                    const Color(0xfff7b053),
                    const Color(0xfff49d42),
                    const Color(0xfff3963d),
                  ],
                  stops: [0.0, 0.232, 0.687, 1.0],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  userDatas(s),
                  editMyProfileButton(),
                  Container(
                    height: s.height * 0.55,
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
      left: s.height * 0.07,
      top: s.height * 0.17,
      child: Container(
        height: s.height * 0.07,
        width: s.height * 0.07,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF2F4F6),
          border: Border.all(
            width: 2,
            color: Color(0xFFF49C42),
          ),
        ),
        child: Image.asset("assets/images/Rozet.png"),
      ),
    );
  }

  photoOfUser(Size s) {
    return Positioned(
      left: 0,
      bottom: s.height * 0.6,
      child: Container(
        height: s.height * 0.2,
        width: s.height * 0.2,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFFF49C42), width: 2),
          shape: BoxShape.circle,
        ),
        child: Image.asset("assets/images/Sarışın Kadın.png"),
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
            child: Container(
              width: s.width * 0.8,
              decoration: BoxDecoration(
                color: Color(0xFFF2F4F6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16),
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
      height: s.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              "Lorem İpsum dolar sit amet Lorem İpsum dolar sit amet Lorem İpsum dolar sit amet Lorem İpsum dolar sit amet",
              style: textStyle(
                22,
                Colors.grey[100],
              ),
            ),
            Spacer(),
            Text(
              "Aktif Proje Sayısı: 4",
              style: textStyle(
                22,
                Colors.grey[100],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Tamamlanan Proje Sayısı: 4",
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
        width: s.width,
        child: Padding(
          padding: EdgeInsets.only(left: s.width * 0.2),
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
      ),
    );
  }
}
