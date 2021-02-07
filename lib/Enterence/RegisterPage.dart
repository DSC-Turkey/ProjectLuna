import 'package:Luna/GetX/FirabaseController.dart';
import 'package:Luna/pages/base.dart';
import 'package:Luna/widgets/myTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegisterPage extends GetWidget<FirebaseController> {
  final String role;
  RegisterPage(this.role);

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mailController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    print("$role");
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          if (mailController.text.isEmail) {
            if (passController.text.length >= 7) {
              registerUser();
            } else {
              Get.snackbar(
                  "Güçsüz Şifre ", "Lütfen en az 7 haneli bir şifre giriniz. ",
                  colorText: Colors.white, backgroundColor: Colors.red);
            }
          } else {
            Get.snackbar("Geçersiz E posta ",
                "Lütfen geçerli bir formatta e posta giriniz. ",
                colorText: Colors.white, backgroundColor: Colors.red);
          }
        },
        child: Container(
          width: s.width * 0.4,
          height: s.height * 0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
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
          child: Center(
            child: Text(
              "GÖNÜLLÜ OL",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: s.height * 0.06,
                  width: s.width,
                  decoration: BoxDecoration(
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: s.width * 0.05),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "GÖNÜLLÜ OL",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: s.height * 0.05),
                    text("Adınız"),
                    textField(nameController, "Adınız", false),
                    text("Soyadınız"),
                    textField(lastNameController, "Soyadınız", false),
                    text("E Postanız"),
                    textField(mailController, "E Postanız", false),
                    text("Telefon Numaranız"),
                    textField(phoneController, "Telefon Numaranız", false),
                    text("Şehir"),
                    textField(cityController, "Şehir", false),
                    text("Şifre Giriniz"),
                    textField(passController, "Şifre Giriniz", true),
                    SizedBox(height: s.height * 0.1),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void registerUser() {
    controller.createUser(
        nameController.text,
        lastNameController.text,
        mailController.text,
        phoneController.text,
        cityController.text,
        passController.text,
        role);
  }

  text(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, top: 12),
      child: Text(
        text,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  textField(TextEditingController controller, String text, bool isPass) {
    final fBcontroller = Get.put(FirebaseController());
    return Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: GetBuilder<FirebaseController>(
          builder: (_) => MyTextFormField(
              // hintText: text,
              // labelText: text,
              isPassword: isPass ? fBcontroller.passMode : false,
              controller: controller,
              suffixIcon: isPass
                  ? IconButton(
                      icon: Icon(
                        fBcontroller.passMode
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        fBcontroller.passModeChange();
                      })
                  : null),
        ));
  }
}
