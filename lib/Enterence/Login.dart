import 'package:Luna/GetX/FirabaseController.dart';
import 'package:Luna/widgets/myTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Luna/Enterence/SelectRole.dart';
import 'package:get/get.dart';

class LoginPage extends GetWidget<FirebaseController> {
  final _formKey = GlobalKey<FormState>();
  String email, pass;
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/Logo Png.png",
                    height: s.height * 0.2,
                    width: s.width * 0.9,
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          "E Posta",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: MyTextFormField(
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
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          "Şifre",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: GetBuilder<FirebaseController>(
                            builder: (_) => MyTextFormField(
                              validator: (String val) {
                                if (val.length <= 0) {
                                  return "Şifre boş bırakılamaz";
                                }
                                return null;
                              },
                              onSaved: (String val) {
                                pass = val;
                              },
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.passMode
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  controller.passModeChange();
                                },
                              ),
                              isPassword: controller.passMode,
                            ),
                          )),
                      SizedBox(height: 20),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              print("Login Clicked Event");
                              _login();
                            }
                          },
                          child: Container(
                            height: s.height * 0.06,
                            width: s.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                begin: Alignment(-1.0, 0.0),
                                end: Alignment(1.0, 0.0),
                                colors: [
                                  const Color(0xff8a84be),
                                  const Color(0xff7a6fb0),
                                  const Color(0xff6958a1)
                                ],
                                stops: [0.0, 0.514, 1.0],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Giriş Yap",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Giriş detaylarını mı unuttun?",
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        "   Yardım al",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFF6862f9),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Get.offAll(SelectRole());
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    controller.login(email, pass);
  }
}
