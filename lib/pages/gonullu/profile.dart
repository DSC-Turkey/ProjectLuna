import 'package:Luna/GetX/FirabaseController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'createProject.dart';

class GonulluProfil extends StatefulWidget {
  @override
  _GonulluProfil createState() => _GonulluProfil();
}

class _GonulluProfil extends State<GonulluProfil> {
  final controller = Get.put(FirebaseController());
  Map<String, dynamic> data = {};
  bool toggleValue = true;
  FirebaseFirestore firestore;
  DocumentSnapshot documentSnapshot;
  void getDatas() async {
    // SharedPreferences.setMockInitialValues({});
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // id = prefs.getString("userID");
    documentSnapshot = await firestore
        .collection("projeler")
        .doc("rOzYjCDKWNmDwt1wVKX6")
        .get();
    print(documentSnapshot.data);
  }

  @override
  void initState() {
    getDatas();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.signout();
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.exit_to_app, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('kullaniciler')
              .doc("${controller.currentUser.uid}")
              .get(),
          builder: (context, snapshot) {
            data = snapshot.data.data();
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //  languegeSelector(),
                  centerOfPage(s),
                ],
              );
            }
          }),
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
              height: s.height * 0.75,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  userDatas(s),
                  editMyProfileButton(),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      userStatics(s),
                      SizedBox(height: 20),
                      buttons(s),
                    ],
                  ),
                  Spacer(),
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
        child: OutlineButton(
            onPressed: () {},
            child: Text(
              "Profili Düzenle",
              style: textStyle(15, Colors.white),
            )),
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
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => CreateProject()));
          },
          child: Container(
            width: s.width * 0.8,
            height: s.width * .15,
            decoration: BoxDecoration(
              color: Color(0xFFF2F4F6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16),
              child: Center(
                child: Text(
                  "Projeler Oluştur",
                  style: textStyle(
                    30,
                    Colors.grey[800],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          child: Container(
            width: s.width * 0.8,
            height: s.width * .15,
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
    );
  }

  userStatics(Size s) {
    return Container(
      height: s.height * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Text(
            data["about"],
            style: textStyle(
              22,
              Colors.grey[100],
            ),
          ),
          Text(
            "Aktif Proje Sayısı: ${data["currentPorjectNumber"]}",
            style: textStyle(
              22,
              Colors.grey[100],
            ),
          ),
          Text(
            "Tamamlanan Proje Sayısı: ${data["complatedProjectNumber"]}",
            style: textStyle(
              22,
              Colors.grey[100],
            ),
          ),
        ],
      ),
    );
  }

  textStyle(double size, Color color) {
    return TextStyle(color: color, fontSize: size);
  }

  userDatas(Size s) {
    return Padding(
      padding: EdgeInsets.only(left: s.width * 0.36),
      child: Container(
        height: s.height * 0.1,
        width: s.width * 0.6,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${data["firstname"]} ${data["lastname"]}",
                style: textStyle(24, Colors.white),
              ),
              Text(
                "${data["userRole"]} ",
                style: textStyle(20, Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
