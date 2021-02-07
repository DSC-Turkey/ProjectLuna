import 'package:Luna/Constants/colors.dart';
import 'package:Luna/Widgets/projectCard.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

class KatilimciKesfetPage extends StatefulWidget {
  _KatilimciKesfetPage createState() => _KatilimciKesfetPage();
}

class _KatilimciKesfetPage extends State<KatilimciKesfetPage> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      color: Colors.orange,
      child: SafeArea(
        child: Scaffold(
          body: randomActiveProject(s),
        ),
      ),
    );
  }

  randomActiveProject(Size s) {
    Map map = {
      "duration": "54",
      "pName": "MMW",
      "gName": "melikhan",
      "pAlani": "Sağlık",
      "lang": "TR",
      "startDate": "1 Mart"
    };
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
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
          padding: const EdgeInsets.only(top: 0.0),
          child: Container(
            height: s.height * 0.7,
            width: s.width,
            child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ProjectCard(
                    s,
                    colors[index % 4],
                    subColors[index % 4],
                    parametrCard[index % 4],
                    parametrAppBar[index % 4],
                    map,
                  );
                }),
          ),
        ),
      ],
    );
  }
}
