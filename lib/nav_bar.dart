import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/Upload_Page.dart';
import 'package:untitled5/doctor_appointment.dart';
import 'package:untitled5/drawer.dart';
import 'package:untitled5/gethelp.dart';

import 'package:untitled5/razorpay.dart';

import 'package:untitled5/settings_page.dart';
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
    //  SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      drawer: drawer(),
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          height: 60,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.chat,
              ),
              label: 'Community',
            ),
            NavigationDestination(
              icon: Icon(Icons.help),
              label: 'SnapHelp',
            ),
            NavigationDestination(
              icon: Icon(Icons.emergency, weight: 400),
              label: 'MediMeet',
            ),
            /*  NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),*/
          ],
        ),
      ),
    );
  }
}
