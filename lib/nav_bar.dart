import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/Upload_Page.dart';
import 'package:untitled5/gethelp.dart';
import 'package:untitled5/pages/profile_page.dart';



import 'package:untitled5/settings_page.dart';
import 'community_page.dart';

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  int index=0;
  final screens=[
    HomeScreen(),
   gethelp(),
   ProfilePage(),
SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:screens[index],
      bottomNavigationBar:NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor:Colors.blue ,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          height: 60,
          selectedIndex: 0,
          onDestinationSelected: (index)=>setState(() =>this.index=index
          ),
          destinations: [
            NavigationDestination(icon: Icon(Icons.chat),
              label: 'Community',),
            NavigationDestination(icon: Icon(Icons.help),
              label: 'Get Help',),
            NavigationDestination(icon: Icon(Icons.person),
              label: 'Profile',),
            NavigationDestination(icon: Icon(Icons.settings),
              label: 'Settings',),
          ],
        ),
      ) ,
    );
  }
}
