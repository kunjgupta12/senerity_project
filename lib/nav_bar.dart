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
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * .009),
        height: displayWidth * .165,
        width: displayWidth*.09,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.6),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
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
            height: 60,
            selectedIndex: index,
            onDestinationSelected: (index) => setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                icon: Image.asset(
                  "img/community_page.png",
                  height: 40,
                  width: 45,
                ),
                label: 'Community',
              ),
              NavigationDestination(
                icon: Image.asset(
                  "img/SnapHelp.png",
                  height: 40,
                  width: 45,
                ),
                label: 'SnapHelp',
              ),
              NavigationDestination(
                icon: Image.asset(
                  "img/MediMeet.png",
                  height: 40,
                  width: 45,
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
