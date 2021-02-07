import 'package:Luna/pages/projectDetail.dart';
import 'package:Luna/pages/searchPage.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

class KatilimciKesfetPage extends StatefulWidget {
  _KatilimciKesfetPage createState() => _KatilimciKesfetPage();
}

class _KatilimciKesfetPage extends State<KatilimciKesfetPage> {
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

  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: SafeArea(
            child: Scaffold(
          body: randomActiveProject(s),
        ),
      ),
    );
  }

  randomActiveProject(Size s) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
          child: AnimSearchBar(
            helpText: "Luna'da Ara",
            rtl: true,
            width: s.width,
            textController: textController,
            onSuffixTap: () {
              setState(() {
                textController.clear();
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: Container(
            height: s.height * 0.8,
            width: s.width,
            child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return item(
                    s,
                    colors[index % 4],
                    subColors[index % 4],
                    parametrCard[index % 4],
                    parametrAppBar[index % 4],
                  );
                }),
          ),
        ),
      ],
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
      child: Container(
        height: s.height * 0.1,
        width: s.height * 0.1,
        child: Image.asset(
          "assets/images/Sarı Takvim.png",
        ),
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
}
