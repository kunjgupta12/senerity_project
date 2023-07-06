import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/auth_controller.dart';
import 'package:untitled5/login_page.dart';
import 'package:untitled5/signup_page.dart';
import 'package:untitled5/splash_screen.dart';
import 'package:untitled5/welcome_page.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',

        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: splashscreen(

        ));
  }
}
