import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:untitled5/auth/auth_controller.dart';
import 'package:untitled5/auth/home.dart';

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
  final FirebaseAuth auth = FirebaseAuth.instance;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordcontroller = TextEditingController();
  late User user;
  late String currentUId;
  late String currentEmail;

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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("img/logoo.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: w * .2,
              ),
              /*     Container(
                width: w * .35,
                height: h * 0.35,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("img/logo.png"),
                        fit: BoxFit.fitHeight)),
              ),*/
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*    Center(
                      child: Text(
                        "Serenity",
                        style: TextStyle(
                          fontFamily: 'JosefinSans',
                          fontSize: 50,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                          // color: Color.fromRGBO(10, 10, 3, 0.8)
                        ),
                      ),
                    ),*/
                    SizedBox(
                      height: w * .5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.8),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 20,
                                  spreadRadius: 7,
                                  offset: Offset(1, 1),
                                  color: Colors.white.withOpacity(.2))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hey Guest",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: 'JosefinSans',
                                        fontSize: w * .08,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                "Create your Account",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: w * .045,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 40,
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
                                  controller: nameController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: "Name",
                                      prefixIcon: Icon(
                                        Icons.person,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.0)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                              ),
                              SizedBox(
                                height: 10,
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
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.0)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                              ),
                              SizedBox(
                                height: 10,
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
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.white, width: 1.0)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (nameController != " ") {
                                    AuthController.instance.register(
                                        emailController.text.trim(),
                                        passwordcontroller.text.trim());
                                  }
                                },
                                child: Container(
                                  width: w * 0.65,
                                  height: h * .15,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30),
                                    //image: DecorationImage(
                                    //   image: AssetImage("img/img.png"), fit: BoxFit.fill)
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Create",
                                      style: TextStyle(
                                        fontFamily: 'JosefinSans',
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: w * .15,
                              ),
                              Column(
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => Get.back(),
                                          text: 'Have an account?',
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              color: Colors.grey[500],
                                              fontSize: w * .045,
                                              fontWeight: FontWeight.w600))),
                                  SizedBox(
                                    height: w * .055,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap =
                                                () => Get.to(() => Home()),
                                          text: 'Create With Mobile number',
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              color: Colors.grey[500],
                                              fontSize: w * .045,
                                              fontWeight: FontWeight.w600))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
