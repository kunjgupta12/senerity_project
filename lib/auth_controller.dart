import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled5/email_auth_register.dart';

import 'package:untitled5/email_authstep.dart';
import 'package:untitled5/login_page.dart';
import 'package:untitled5/nav_bar.dart';
import 'package:untitled5/signup_page.dart';
import 'package:untitled5/welcome_page.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isEmailVerified = false;
  late User user;
  late String currentUId;
  late String currentEmail;
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
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Get.offAll(() => EmailVerificationScreenregister());
      user = auth.currentUser!;

      CollectionReference collref =
          FirebaseFirestore.instance.collection('Users');

      collref.add({
        'password': password,
        'email': email,
        'uid': user.uid.toString(),
      });
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

      if (isEmailVerified) {
        Get.offAll(profilepage());
      } else {
        Get.offAll(EmailVerificationScreen());
      }
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
