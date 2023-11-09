import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/drawer/T@C.dart';
import 'package:untitled5/drawer/privacy-policy.dart';
import 'package:untitled5/pro.dart';
import 'package:untitled5/snaphelp/gethelp.dart';
import 'package:untitled5/auth/login_page.dart';
import 'package:untitled5/drawer/profile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../auth/ForgotPasswordPage.dart';
import '../medimeet/booking_page.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    Future<void> showMyDialogReply() async {
      String k = 'kunj';
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Signout"),
            actions: [
              TextButton(
                  onPressed: () {
                    auth.signOut().then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Loginpage()));
                    });
                  },
                  child: Text("Confirm")),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Stay"),
              )
            ],
          );
        },
      );
    }

    double displayWidth = MediaQuery.of(context).size.width;
    double displayheight = MediaQuery.of(context).size.height;
    final firestore =
        FirebaseFirestore.instance.collection('Users').snapshots();

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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Scene()));
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
              onTap: () {},
            ),
            ListTile(
              leading: Image.asset(
                "img/Privacy.png",
                height: 40,
                width: displayWidth * .07,
              ),
              title: const Text('Privacy Policy'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  privacy_policy()));

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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  terms_condition()));
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
                  showMyDialogReply();
                }),
          ],
        ),
      ),
    );
  }
}
