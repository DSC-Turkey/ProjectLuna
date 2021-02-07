import 'package:Luna/Enterence/Login.dart';
import 'package:Luna/Enterence/RegisterPage.dart';
import "package:flutter/material.dart";
import 'package:flip_card/flip_card.dart';
import 'package:get/get.dart';

class SelectRole extends StatefulWidget {
  @override
  _SelectRole createState() => _SelectRole();
}

class _SelectRole extends State<SelectRole> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey1 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey2 = GlobalKey<FlipCardState>();
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: s.height * 0.1),
              Center(
                child: Image.asset(
                  "assets/images/Logo Png.png",
                  height: s.height * 0.2,
                  width: s.width * 0.9,
                ),
              ),
              Column(
                children: [
                  itemRight(s, "GÖNÜLLÜ OL", Colors.orange,
                      "assets/images/Gönüllü ol.png", true, cardKey),
                  SizedBox(height: s.height * 0.03),
                  itemLeft(s, "LUNAR OL", Colors.purple,
                      "assets/images/Lunar ol.png", cardKey1),
                  SizedBox(height: s.height * 0.03),
                  itemRight(s, "KATILIMCI OL", Colors.blueGrey,
                      "assets/images/Katılımcı ol.png", false, cardKey2),
                  SizedBox(height: s.height * 0.03),
                  backToLogin(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  backToLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Zaten Hesabın Var Mı?  ",
          style: TextStyle(fontSize: 22),
        ),
        FlatButton(
          onPressed: () {
            Get.offAll(LoginPage());
          },
          child: Text(
            "Giriş Yap",
            style: TextStyle(
                fontSize: 22,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  itemRight(
      Size s, String text, Color color, String imgPath, bool top, var key) {
    return FlipCard(
      key: key,
      flipOnTouch: true,
      direction: FlipDirection.VERTICAL,
      front: Container(
        height: s.height * 0.15,
        width: s.width * 0.9,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: s.height * 0.15,
                width: s.width * 0.9,
                decoration: top
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
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
                      )
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        gradient: LinearGradient(
                          begin: Alignment(-1.0, 0.0),
                          end: Alignment(1.0, 0.0),
                          colors: [
                            const Color(0xff6088b0),
                            const Color(0xff54789b),
                            const Color(0xff405b75)
                          ],
                          stops: [0.0, 0.399, 1.0],
                        ),
                      ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                imgPath,
                height: s.height * 0.18,
                width: s.width * 0.2,
              ),
            )
          ],
        ),
      ),
      back: Container(
        height: s.height * 0.15,
        width: s.width * 0.9,
        decoration: top
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(32),
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
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                  begin: Alignment(-1.0, 0.0),
                  end: Alignment(1.0, 0.0),
                  colors: [
                    const Color(0xff6088b0),
                    const Color(0xff54789b),
                    const Color(0xff405b75)
                  ],
                  stops: [0.0, 0.399, 1.0],
                ),
              ),
        child: Row(
          children: [
            Container(
              height: s.height * 0.15,
              width: s.width * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => top
                          ? RegisterPage("gonullu")
                          : RegisterPage("katilimci")),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8, bottom: 8),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: s.height * 0.04,
                    width: s.width * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Kayıt Ol",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  itemLeft(Size s, String text, Color color, String imgPath, var key) {
    return FlipCard(
      key: key,
      flipOnTouch: true,
      direction: FlipDirection.HORIZONTAL,
      front: Container(
        height: s.height * 0.15,
        width: s.width * 0.9,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: s.height * 0.15,
                width: s.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: LinearGradient(
                    begin: Alignment(-1.0, 0.0),
                    end: Alignment(1.0, 0.0),
                    colors: [
                      const Color(0xff8a84be),
                      const Color(0xff7a6fb0),
                      const Color(0xff6958a1)
                    ],
                    stops: [0.0, 0.514, 1.0],
                  ),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 5,
              child: Image.asset(
                imgPath,
                height: s.height * 0.18,
                width: s.width * 0.23,
              ),
            )
          ],
        ),
      ),
      back: Container(
        height: s.height * 0.15,
        width: s.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: LinearGradient(
            begin: Alignment(-1.0, 0.0),
            end: Alignment(1.0, 0.0),
            colors: [
              const Color(0xff8a84be),
              const Color(0xff7a6fb0),
              const Color(0xff6958a1)
            ],
            stops: [0.0, 0.514, 1.0],
          ),
        ),
        child: Row(
          children: [
            Container(
              height: s.height * 0.18,
              width: s.width * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterPage("lunar")));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 4, bottom: 8),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: s.height * 0.04,
                    width: s.width * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Kayıt Ol",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
