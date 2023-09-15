import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/gethelp.dart';
import 'package:untitled5/login_page.dart';
import 'package:untitled5/profile.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ForgotPasswordPage.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayheight = MediaQuery.of(context).size.height;
    final firestore =
        FirebaseFirestore.instance.collection('Users').snapshots();
    final FirebaseAuth auth = FirebaseAuth.instance;
    late User user;
    late String currentUId;
    late String currentEmail;
    late String number;
    user = auth.currentUser!;
    currentUId = user.uid.toString();
    currentEmail = user.email.toString();
    number = user.phoneNumber.toString();
    return Drawer(
      width: displayWidth * .72,
      child: Container(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.all(4),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black54,
              ),
              child: Text(
                " Unique User Id: " +
                    user.uid +
                    '\n' +
                    " Email Id: " +
                    currentEmail +
                    '\n' +
                    " Mobile Number:" +
                    number,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            ListTile(
              leading: Image.asset(
                "img/My profile.png",
                height: displayheight * .5,
                width: displayWidth * .07,
              ),
              title: const Text(
                'Profile & Location ',
                style: TextStyle(),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepagee()));
              },
            ),
            ListTile(
              leading: Image.asset(
                "img/Security.png",
                height: 40,
                width: displayWidth * .07,
              ),
              title: const Text('Security'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset(
                "img/Support.png",
                height: 40,
                width: displayWidth * .07,
              ),
              title: const Text('Support'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => gethelp()));
              },
            ),
            ListTile(
              leading: Image.asset(
                "img/Privacy.png",
                height: 40,
                width: displayWidth * .07,
              ),
              title: const Text('Privacy Policy'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset(
                "img/Terms of service.png",
                height: 40,
                width: displayWidth * .07,
              ),
              title: const Text('Terms of service'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: displayheight * .0001,
            ),
            ListTile(
              leading: Image.asset(
                "img/signout.png",
                height: 40,
                width: displayWidth * .07,
              ),
              title: const Text('Signout'),
              onTap: () {
                //    navigateSecondPage(ForgotPasswordPage());
                auth.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Loginpage()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
