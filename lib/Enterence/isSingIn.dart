import 'package:Luna/pages/base.dart';
import 'package:Luna/Enterence/Login.dart';
import 'package:Luna/GetX/FirabaseController.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class IsSignedIn extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<FirebaseController>().user != null ? Base() : LoginPage();
    });
  }
}
