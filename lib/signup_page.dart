import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:untitled5/auth_controller.dart';
import 'package:untitled5/welcome_page.dart';

String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Enter a valid email address'
      : null;
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignuppageState();
}

class _SignuppageState extends State<SignupPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  var emailController = TextEditingController();
  var passwordcontroller = TextEditingController();

  List images = [
    "g.png",
    "t.png",
    "f.png",
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: w * .9,
              height: h * 0.45,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/logo.png"),
                      fit: BoxFit.fitHeight)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sign into your Account",
                    style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(.2))
                        ]),
                    child: TextFormField(
                      controller: emailController,
                      validator: validateEmail,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "Email id",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.deepOrangeAccent,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(.2))
                        ]),
                    child: TextFormField(
                      controller: passwordcontroller,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(
                            Icons.password_outlined,
                            color: Colors.deepOrangeAccent,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: () {
                AuthController.instance.register(emailController.text.trim(),
                    passwordcontroller.text.trim());
                final User? user = auth.currentUser;
                CollectionReference collref =
                    FirebaseFirestore.instance.collection('Users');

                collref.add({
                  'password': passwordcontroller.text,
                  'email': emailController.text,
                  'uid': user?.uid.toString(),
                });
              },
              child: Container(
                width: w * 0.38,
                height: h * .15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage("img/img.png"), fit: BoxFit.fill)),
                child: Center(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: 'Have an account?',
                    style: TextStyle(fontSize: 20, color: Colors.grey[500]))),
            SizedBox(
              height: w * 0.02,
            ),
            RichText(
                text: TextSpan(
              text: "Sign up using one of the following methods!!!",
              style: TextStyle(color: Colors.grey[500], fontSize: 20),
            )),
            Wrap(
              children: List<Widget>.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[500],
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("img/" + images[index]),
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
