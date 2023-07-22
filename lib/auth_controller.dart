import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled5/Upload_Page.dart';
import 'package:untitled5/email_authstep.dart';
import 'package:untitled5/login_page.dart';
import 'package:untitled5/nav_bar.dart';
import 'package:untitled5/welcome_page.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isEmailVerified = false;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("login page");
      Get.offAll(() => Loginpage());
    } else if (isEmailVerified!) {
      Get.offAll(() => MainPage());
    } else {
      bool check = false;
      Get.offAll(() => Welcomepage(email: user.email!));
    }
  }

  void checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.offAll(() => EmailVerificationScreen());
    } catch (e) {
      Get.snackbar(
        "About user",
        "User message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Account creation failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(profilepage());
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Login  failed",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }

  void Logout() async {
    await auth.signOut();
  }
}
