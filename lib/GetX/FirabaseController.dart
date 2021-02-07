import 'package:Luna/pages/araci/base.dart';
import 'package:Luna/pages/base.dart';

import 'package:Luna/Enterence/Login.dart';
import 'package:Luna/pages/gonullu/base.dart';
import 'package:Luna/pages/katilimci/base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool passMode = true;

  void passModeChange() {
    print("sddss");
    passMode = !passMode;
    update();
  }

  DocumentReference myUser;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  Rx<User> _firebaseUser = Rx<User>();

  User get currentUser => _auth.currentUser;
  String get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());

    print(" Auth Change :   ${_auth.currentUser}");

    super.onInit();
  }

  // function to createuser, login and sign out user

  void createUser(String firstname, lastname, email, phoneNumber, city,
      password, role) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        FirebaseFirestore.instance
            .collection("kullaniciler")
            .doc(value.user.uid)
            .set({
          "userID": value.user.uid,
          "firstname": firstname,
          "lastname": lastname,
          "email": email,
          "phoneNumber": phoneNumber,
          "city": city,
          "about": "Bu kişi henüz hakkında kısmını doldurmadı",
          "currentPorjectNumber": 0,
          "complatedProjectNumber": 0,
          "userRole": role,
        });
      }).then((value) {
        if (role == "Lunar") {
          Get.offAll(AraciBase());
        }
        if (role == "Katılımcı") {
          Get.offAll(KatilimciBase());
        }
        if (role == "Gönüllü") {
          Get.offAll(GonulluBase());
        }
      });

      // reference.add(userdata).then((value) => Get.offAll(Base()));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password' ||
          ' The given password is invalid.' == e.code) {
        print('The password provided is too weak.');
        Get.snackbar(
            "Güçsüz Şifre ", "Lütfen en az 7 haneli bir şifre giriniz. ",
            colorText: Colors.white, backgroundColor: Colors.red);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar(
            "Var olan kullanıcı", "Lütfen giriş bilgilerinizi kontrol ediniz. ",
            colorText: Colors.white, backgroundColor: Colors.red);
      }
      return null;
    } catch (e) {
      debugPrint("Kullanıcı Giriş yaparken  Hata çıktı:  $e");
      return null;
    }
  }

  void login(String email, String password) async {
    String uid = "";
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        uid = value.user.uid;

        FirebaseFirestore.instance
            .collection('kullaniciler')
            .doc(value.user.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.data()['userRole'] == "Lunar") {
            Get.offAll(AraciBase());
          }
          if (documentSnapshot.data()['userRole'] == "Katılımcı") {
            Get.offAll(KatilimciBase());
          }
          if (documentSnapshot.data()['userRole'] == "Gönüllü") {
            Get.offAll(GonulluBase());
          }
        });
      }).whenComplete(() {});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Kullanıcı bulunamadı",
            "Lütfen giriş bilgilerinizi kontrol ediniz. ",
            colorText: Colors.white, backgroundColor: Colors.red);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Kullanıcı adı veya şifre hatalı",
            "Lütfen giriş bilgilerinizi kontrol ediniz. ",
            colorText: Colors.white, backgroundColor: Colors.red);
        print('Wrong password provided for that user.');
      }
      return null;
    } catch (e) {}
  }

  void signout() async {
    await _auth.signOut().then((value) => Get.offAll(LoginPage()));
  }

  void sendpasswordresetemail(String email) async {
    await _auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(LoginPage());
      Get.snackbar("Password Reset email link is been sent", "Success");
    }).catchError(
        (onError) => Get.snackbar("Error In Email Reset", onError.message));
  }

  Future<void> deleteuseraccount(String email, String pass) async {
    User user = _auth.currentUser;

    AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: pass);

    await user.reauthenticateWithCredential(credential).then((value) {
      value.user.delete().then((res) {
        Get.offAll(LoginPage());
        Get.snackbar("User Account Deleted ", "Success");
      });
    }).catchError((onError) => Get.snackbar("Credential Error", "Failed"));
  }

  void googleSignInMetot() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    await _auth
        .signInWithCredential(credential)
        .then((value) => Get.offAll(Base()));
  }

  void googleSignOut() async {
    await googleSignIn.signOut().then((value) => Get.offAll(LoginPage()));
  }
}
