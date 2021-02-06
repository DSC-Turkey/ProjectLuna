import 'package:Luna/Enterence/Login.dart';
import 'package:Luna/GetX/FirabaseController.dart';
import 'package:Luna/Widgets/SocialLogin.dart';
import 'package:Luna/pages/base.dart';
import 'package:Luna/widgets/myTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class RegisterPage extends GetWidget<FirebaseController> {
  final String role;
  RegisterPage(this.role);
  String firstn, lastn, email, pass;
  bool passwordVisible = true;
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
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Base()));
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
    controller.createUser(firstn, lastn, email, pass, role);
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: MyTextFormField(
          // hintText: text,
          // labelText: text,
          controller: controller,
          onSaved: (String val) {
            email = val;
          },
          suffixIcon: isPass
              ? IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Color(0xfff49d42),
                  ),
                  onPressed: () {})
              : IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: () {})),
    );
  }
}
