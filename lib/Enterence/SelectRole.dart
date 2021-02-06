import 'package:Luna/Enterence/RegisterPage.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class SelectRole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              RaisedButton(
                onPressed: () => Get.offAll(
                  RegisterPage("katilimci"),
                ),
                child: Text("Katılımcı Ol "),
                color: Colors.orange,
              ),
              RaisedButton(
                onPressed: () => Get.offAll(
                  RegisterPage("gonullu"),
                ),
                child: Text("Gönüllü Ol "),
                color: Colors.orange,
              ),
              RaisedButton(
                onPressed: () => Get.offAll(
                  RegisterPage("egitmen"),
                ),
                child: Text("Eğitmen Ol "),
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
