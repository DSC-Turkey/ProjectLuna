import 'package:Luna/GetX/FirabaseController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialSignWidgetRow extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RaisedButton(
          onPressed: () {
            print("Google Clicked");
            controller.google_signIn();
          },
          color: Colors.green,
          child: Text("google"),
        ),
      ],
    );
  }
}
