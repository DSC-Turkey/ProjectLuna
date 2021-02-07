import 'package:flutter/material.dart';

class ProjectCardText extends StatelessWidget {
  final String pName, gName, pAlani, duration, lang;
  ProjectCardText({
    @required this.pName,
    @required this.gName,
    @required this.pAlani,
    @required this.duration,
    @required this.lang,
  });

  textStyle(double size) {
    return TextStyle(
      color: Colors.white,
      fontSize: size,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pName,
          style: textStyle(25),
        ),
        Text(
          gName,
          style: textStyle(21),
        ),
        Row(
          children: [
            Text(
              pAlani,
              style: textStyle(20),
            ),
            SizedBox(width: 30),
            Icon(
              Icons.access_time,
              color: Colors.white,
            ),
            Text(
              " $duration | ",
              style: textStyle(15),
            ),
            Icon(
              Icons.language,
              color: Colors.white,
            ),
            Text(
              " $lang",
              style: textStyle(15),
            )
          ],
        ),
      ],
    );
  }
}
