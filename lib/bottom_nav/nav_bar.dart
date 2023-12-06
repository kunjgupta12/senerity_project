import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/medimeet/doctor_appointment.dart';
import 'package:untitled5/medimeet/medimeet_homescreen.dart';

import 'package:untitled5/snaphelp/razorpay.dart';

//import 'package:untitled5/settings_page.dart';
import 'package:untitled5/community/community_page.dart';

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  int index = 0;
  final screens = [HomeScreen(), paymemnt(), Medimeet()];
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width * 1.4;
    double displayheight = MediaQuery.of(context).size.height;
    final items = <Widget>[
      Image.asset(
        "img/community.png",
        height: displayheight * .05,
        width: displayWidth * .09,
      ),
      Image.asset(
        "img/SnapHelp.png",
        height: displayheight * .05,
        width: displayWidth * .09,
      ),
      Image.asset(
        "img/MediMeet.png",
        height: displayheight * .05,
        width: displayWidth * .09,
      ),
    ];
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return ClipRect(
      child: Scaffold(
          body: screens[index],
          bottomNavigationBar: CurvedNavigationBar(
            items: items,
            animationCurve: Curves.fastEaseInToSlowEaseOut,
            animationDuration: Duration(milliseconds: 200),
            color: Color.fromRGBO(255, 237, 237, 1),
            buttonBackgroundColor: Color.fromRGBO(49, 164, 153, 1),
            backgroundColor: Colors.transparent,
            height: displayheight * .085,
            index: index,
            onTap: (index) => setState(() => this.index = index),
          )),
    );
  }
}
