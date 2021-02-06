import 'package:Luna/Enterence/RegisterPage.dart';
import 'package:Luna/GetX/FirabaseController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends GetWidget<FirebaseController> {
  final _formKey = GlobalKey<FormState>();
  String email;
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
              SizedBox(
                height: 20,
              ),
              Text("Şifreyi Yenile"),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFormField(
                  validator: (String val) {
                    if (!GetUtils.isEmail(val)) {
                      return "Lütfen geçerli bir e posta adresi girirniz... ";
                    }
                    return "";
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
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    controller.sendpasswordresetemail(email);
                  }
                },
                child: Text("Şifreyi Yenile"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => RegisterPage()));
          },
          child: RichText(
            text: TextSpan(
              text: 'Hesabın yok mu?',
              style: TextStyle(fontSize: 15.0, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: ' Kayıt Ol',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0XFF4321F5)),
                ),
              ],
            ),
          )),
    );
  }
}
