import 'package:flutter/material.dart';

class ProjectDetail extends StatefulWidget {
  @override
  _ProjectDetail createState() => _ProjectDetail();
}

class _ProjectDetail extends State<ProjectDetail> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.exit_to_app)
        ],
        backgroundColor: Color(0xFF8883BD),
        title: Text("Proje Adı"),
      ),
      body: Center(
        child: Container(
          height: s.height * 0.7,
          width: s.width * 0.9,
          decoration: BoxDecoration(
             color: Color(0xFF8883BD),
             borderRadius: BorderRadius.circular(40)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              image(s),
              projectDatas(),
              bottomPlace(s),
            ],
          ),
        ),
      ),
    );
  }

  bottomPlace(Size s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        nextLessonTime(),
        SizedBox(height: s.height*0.025),
        buttons(s),
      ],
    );
  }

  buttons(Size s) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: s.width * 0.4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white, width: 3)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Ders Planı         Oluştur",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        Container(
          width: s.width * 0.4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white, width: 3)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Projeyi        Başlat",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }

  nextLessonTime() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Text(
        "Sıradaki Ders: 07.02.2021 16:00",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  image(Size s) {
    return Center(
      child: Container(
        height: s.height * 0.2,
        width: s.width * 0.8,
        //child: Image.network(""),
        color: Colors.white,
      ),
    );
  }

  projectDatas() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Alanı: Dil",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          Text(
            "Proje Konusu: İngilizce",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          Text(
            "Ders Saati: 8",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ],
      ),
    );
  }
}
