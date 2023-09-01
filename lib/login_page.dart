import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled5/auth_controller.dart';
import 'package:untitled5/signup_page.dart';

import 'ForgotPasswordPage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final emailController = TextEditingController();
  var passwordcontroller = TextEditingController();
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("img/Opening Page background.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: w * .09,
              ),
              Container(
                width: w * 0.35,
                height: h * 0.35,
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
                    Center(
                      child: Text(
                        "Serenity",
                        style: TextStyle(
                          fontFamily: 'JosefinSans',
                          fontSize: w * .1,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                          // color: Color.fromRGBO(10, 10, 3, 0.8)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: w * .2,
                    ),
                    Text(
                      "Hey There!",
                      style: TextStyle(
                        fontFamily: 'JosefinSans',
                        fontSize: w * .1,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                        // color: Color.fromRGBO(10, 10, 3, 0.8)
                      ),
                    ),
                    Text(
                      "Lets go back to your personal space",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: w * .05, color: Colors.black,
                        // fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(
                      height: w * .08,
                    ),
                    Container(
                      width: w,
                      height: h * .18,
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
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.deepOrangeAccent,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    SizedBox(
                      height: w * .02,
                    ),
                    Container(
                      width: w,
                      height: h * .18,
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
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.deepOrangeAccent,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ForgotPasswordPage();
                            }));
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: w * .04,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * .08,
              ),
              GestureDetector(
                onTap: () {
                  AuthController.instance.login(emailController.text.trim(),
                      passwordcontroller.text.trim());
                },
                child: Container(
                  width: w * 0.38,
                  height: h * .15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black
                      //  image: DecorationImage(
                      //     image: AssetImage("img/img.png"), fit: BoxFit.fill)
                      ),
                  child: Center(
                    child: Text(
                      "Login",
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
                height: h * .25,
              ),
              RichText(
                  text: TextSpan(
                      text: "Don\'t have an account?",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.grey[500],
                          fontSize: w * .045,
                          fontWeight: FontWeight.w600),
                      children: [
                    TextSpan(
                        text: "Create one for Free!!",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: w * .045,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => SignupPage()))
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
