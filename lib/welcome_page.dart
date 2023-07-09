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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("img/img_1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: w*.8,
              height: h * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/logo.png"), fit: BoxFit.fitHeight)),
              child: Column(
                children: [
                  SizedBox(
                    height: h * .3,
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 250,
            ),
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to the"      "                               Serenity Family...........",
                    style: TextStyle(

                        fontSize: 46,
                        fontWeight: FontWeight.w800,
                        color: Colors.black54),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    " "+email,
                    style: TextStyle(fontSize: 20, color: Colors.black87,fontWeight: FontWeight.w600),
                  ),
                ],
              ),
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
                      text: "Proceed",
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 20,

                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => HomeScreen()))
                ]))
          ],
        ),
      ),
    );
  }
}
