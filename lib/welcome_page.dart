import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled5/auth_controller.dart';
import 'package:untitled5/Upload_Page.dart';
import 'package:untitled5/community_page.dart';
import 'package:untitled5/signup_page.dart';
import 'package:untitled5/button_widget.dart';

class Welcomepage extends StatelessWidget {
  String email;
  Welcomepage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Scaffold(


      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("img/logo.png"), fit: BoxFit.fitHeight)),
            child: Column(
              children: [
                SizedBox(
                  height: h * .3,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 40,
                  backgroundImage: AssetImage("img/logo.png"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Text(
                  email,
                  style: TextStyle(fontSize: 18, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
          ),
          GestureDetector(
            onTap: () {
              AuthController.instance.Logout();
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
                  "Sign out",
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
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  text: "",
                  style: TextStyle(color: Colors.grey[500], fontSize: 20),
                  children: [
                TextSpan(
                    text: "Procced",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => HomeScreen()))
              ]))
        ],
      ),
    );
  }
}
