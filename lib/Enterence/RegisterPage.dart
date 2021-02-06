import 'package:Luna/Enterence/Login.dart';
import 'package:Luna/GetX/FirabaseController.dart';
import 'package:Luna/Widgets/SocialLogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegisterPage extends GetWidget<FirebaseController> {
  final String role;
  RegisterPage(this.role);
  String firstn, lastn, email, pass;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text("Kayıt Ol"),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'İsim*',
                        // hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          // borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          // borderSide: BorderSide(
                          //   color: Colors.blue[400],
                          // ),
                        ),
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      // cursorColor: Colors.white,
                      // style: TextStyle(color: Colors.white),
                      validator: (String val) {
                        if (val.length <= 0) {
                          return "İsim boş bırakılamaz";
                        }
                      },
                      onSaved: (String val) {
                        firstn = val;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      validator: (String val) {
                        if (val.length <= 0) {
                          return "Soyisim boş bırakılamaz";
                        }
                      },
                      onSaved: (String val) {
                        lastn = val;
                      },
                      decoration: InputDecoration(
                        hintText: 'Soyisim*',
                        // hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          // borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          // borderSide: BorderSide(
                          //   color: Colors.blue[400],
                          // ),
                        ),
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      // cursorColor: Colors.white,
                      // style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      validator: (String val) {
                        if (!GetUtils.isEmail(val)) {
                          return "Lütfen geçerli bir e posta adresi girirniz... ";
                        }
                      },
                      onSaved: (String val) {
                        email = val;
                      },
                      decoration: InputDecoration(
                        hintText: 'E posta',
                        // hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          // borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          // borderSide: BorderSide(
                          //   color: Colors.blue[400],
                          // ),
                        ),
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      // cursorColor: Colors.white,
                      // style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      validator: (String val) {
                        if (val.length <= 0) {
                          return "Şifre boş bırakılamaz";
                        }
                      },
                      onSaved: (String val) {
                        pass = val;
                      },
                      decoration: InputDecoration(
                        hintText: 'Şifre*',
                        // hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          // borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          // borderSide: BorderSide(color: Colors.blue[400])
                        ),
                        isDense: true, // Added this
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                      // cursorColor: Colors.white,
                      // style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          registerUser();
                        }
                      },
                      child: Text("Kayıt Ol")),
                  SizedBox(height: 20),
                  SocialSignWidgetRow(),
                  Text("İle Giriş Yap"),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Get.offAll(LoginPage());
          },
          child: RichText(
            text: TextSpan(
              text: ' Hesabın var mı?',
              style: TextStyle(fontSize: 15.0, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: ' Giriş Yap',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0XFF4321F5)),
                ),
              ],
            ),
          ),
        ));
  }

  void registerUser() {
    controller.createUser(firstn, lastn, email, pass, role);
  }
}
