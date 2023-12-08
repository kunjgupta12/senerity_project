import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/auth/auth_controller.dart';

import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';
import 'package:untitled5/firebase_options.dart';
import 'package:untitled5/medimeet/booking_page.dart';
import 'package:untitled5/medimeet/doctor_appointment.dart';
import 'package:untitled5/medimeet/doctor_details.dart';
import 'package:untitled5/bottom_nav/nav_bar.dart';
import 'package:untitled5/splash_screen.dart';
import 'package:untitled5/medimeet/success.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAppCheck.instance.activate();
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
