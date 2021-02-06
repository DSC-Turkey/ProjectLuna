import 'package:Luna/pages/searchPage.dart';
import 'package:flutter/material.dart';

class GonulluKesfetPage extends StatefulWidget {
  _GonulluKesfetPage createState() => _GonulluKesfetPage();
}

class _GonulluKesfetPage extends State<GonulluKesfetPage> {
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
