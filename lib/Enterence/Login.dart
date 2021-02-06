import 'package:Luna/Enterence/ForgetPass.dart';
import 'package:Luna/Enterence/RegisterPage.dart';
import 'package:Luna/GetX/FirabaseController.dart';
import 'package:Luna/Widgets/SocialLogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetWidget<FirebaseController> {
  final _formKey = GlobalKey<FormState>();
  String email, pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Giriş Yap"),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextFormField(
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
                    validator: (String val) {
                      if (!GetUtils.isEmail(val)) {
                        return "Lütfen geçerli bir e posta adresi girirniz... ";
                      }
                      return null;
                    },
                    onSaved: (String val) {
                      email = val;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Şifre',
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
                        return "Şifre boş bırakılamaz";
                      }
                      return null;
                    },
                    onSaved: (String val) {
                      pass = val;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    Get.to(ForgotPassword());
                  },
                  color: Colors.black,
                  child: Text(
                    "Şifremi Unuttum",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      print("Login Clicked Event");
                      _login();
                    }
                  },
                  child: Text("Giriş Yap"),
                ),
                SizedBox(
                  height: 20,
                ),
                SocialSignWidgetRow(),
                Text("ile Giriş yap"),
              ],
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Get.offAll(RegisterPage());
          },
          child: RichText(
              text: TextSpan(
            text: ' Hesabın yok mu?',
            style: TextStyle(fontSize: 15.0, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: ' Kayıt ol',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0XFF4321F5)),
              ),
            ],
          )),
        ));
  }

  void _login() {
    controller.login(email, pass);
  }
}
