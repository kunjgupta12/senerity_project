import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled5/nav_bar.dart';

import 'auth_controller.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Firebase.initializeApp().then((value) => Get.put(AuthController()));
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => profilepage(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(

          //  width: double.maxFinite,
          // height: double.maxFinite,

          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/Opening Page background.png"),
                fit: BoxFit.fitHeight
                //  fit: BoxFit.fill,
                ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: w * .45,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: w * 0.35,
                      height: h * 0.35,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("img/logo.png"),
                        //      fit: BoxFit.fitHeight
                      )),
                    ),
                    Text(
                      "Serenity",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'JosefinSans',
                        fontSize: w * .14,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                        // color: Color.fromRGBO(10, 10, 3, 0.8)
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  width: w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: w * .30,
                            child: Text(
                              "STOP THE STIGMA LET'S TALK ABOUT  MENTAL HEALTH",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: w * .06,
                                fontFamily: 'Montserrat',
                                // fontSize: w * .1,
                                //  decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w800,
                                // color: Color.fromRGBO(10, 10, 3, 0.8)
                              ),
                            ),
                          ),
                          Image(
                            image: AssetImage("img/Untitled.png"),
                            width: w * .55,
                            height: h * .7,
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(
                height: h * .33,
              ),
              Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: w * .1,
                    ),
                    Text(
                      "An Initiative by",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SourceCodepro',
                        fontSize: w * .04,

                        fontWeight: FontWeight.w300,
                        // color: Color.fromRGBO(10, 10, 3, 0.8)
                      ),
                    ),
                    Text(
                      "  SPK Welfare Foundation",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'JosefinSans', //aloja
                        fontSize: w * .04,

                        fontWeight: FontWeight.w300,
                        // color: Color.fromRGBO(10, 10, 3, 0.8)
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
