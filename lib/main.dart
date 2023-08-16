import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/auth_controller.dart';

import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';

import 'package:untitled5/nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
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
      home: profilepage(),
    );
  }
}
