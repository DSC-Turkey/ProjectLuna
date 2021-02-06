import 'package:Luna/GetX/FirabaseController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Base extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          color: Colors.red,
          onPressed: () {
            controller.signout();
          },
        ),
      ),
    );
  }
}
