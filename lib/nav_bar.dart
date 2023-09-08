import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/Upload_Page.dart';
import 'package:untitled5/doctor_appointment.dart';

import 'package:untitled5/razorpay.dart';

//import 'package:untitled5/settings_page.dart';
import 'community_page.dart';

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  int index = 0;
  final screens = [
    HomeScreen(),
    paymemnt(),
    doctor(),
  ];
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayheight = MediaQuery.of(context).size.height;

    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayheight * .012),
        height: displayheight * .065,
        width: displayWidth*.5,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.6),
              blurRadius: 10,
spreadRadius: 7
            ),
          ],
          borderRadius: BorderRadius.circular(60),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.blueGrey,
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                fontFamily: 'SourceCodePro',
              ),
            ),
          ),
          child: NavigationBar(
            backgroundColor: Colors.white12,
            height: displayheight * .8,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                icon: Image.asset(
                  "img/community.png",
                  height: displayheight*.04,
                  width: displayWidth * .08,
                ),
                label: 'Community',
              ),
              NavigationDestination(
                icon: Image.asset(
                  "img/SnapHelp.png",
                  height:displayheight*.04,
                  width: displayWidth * .08,
                ),
                label: 'SnapHelp',
              ),
              NavigationDestination(
                icon: Image.asset(
                  "img/MediMeet.png",
                  height: displayheight*.04,
                  width: displayWidth * .08,
                ),
                label: 'MediMeet',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
