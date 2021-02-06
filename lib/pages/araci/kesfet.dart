import 'package:flutter/material.dart';

import '../searchPage.dart';

class AraciKesfetPage extends StatefulWidget {
  _AraciKesfetPage createState() => _AraciKesfetPage();
}

class _AraciKesfetPage extends State<AraciKesfetPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
            },
          )
        ],
      ),
      body: randomActiveProject(s),
    );
  }

  randomActiveProject(Size s) {
    return Container(
      height: s.height * 0.9,
      width: s.width,
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          20,
          (index) {
            return item(index);
          },
        ),
      ),
    );
  }

  item(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.pink,
        child: Center(
          child: Text("${index + 1}"),
        ),
      ),
    );
  }
}
