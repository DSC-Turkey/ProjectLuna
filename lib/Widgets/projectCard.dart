import 'package:Luna/Widgets/projectCardText.dart';
import 'package:Luna/pages/projectDetail.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final Size s;
  final BoxDecoration color, subColor, parametr, appBar;
  final Map projectInfo;
  ProjectCard(
    this.s,
    this.color,
    this.subColor,
    this.parametr,
    this.appBar,
    this.projectInfo,
  );
  @override
  Widget build(BuildContext context) {
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
              middleOfCard(s, color, projectInfo),
              userPhoto(s, subColor),
              note(s, projectInfo),
            ],
          ),
        ),
      ),
    );
  }

  note(Size s, Map pCard) {
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
              child: Text(pCard["startDate"]),
            ),
          )
        ],
      ),
    );
  }

  middleOfCard(Size s, BoxDecoration color, Map pCard) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: s.width * 0.8,
        height: s.height * 0.14,
        decoration: color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: s.height * 0.07),
              ProjectCardText(
                duration: pCard["duration"],
                gName: pCard["gName"],
                lang: pCard["lang"],
                pAlani: pCard["pAlani"],
                pName: pCard["pName"],
              ),
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
}
