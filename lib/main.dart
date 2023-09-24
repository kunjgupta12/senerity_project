import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/auth_controller.dart';

import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';
import 'package:untitled5/booking_page.dart';
import 'package:untitled5/doctor_appointment.dart';
import 'package:untitled5/doctor_details.dart';

import 'package:untitled5/nav_bar.dart';
import 'package:untitled5/splash_screen.dart';
import 'package:untitled5/success.dart';

void main() async {
//  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Serenity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splashscreen(),
    );
  }
}
