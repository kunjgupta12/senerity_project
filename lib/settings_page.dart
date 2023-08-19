import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:untitled5/ForgotPasswordPage.dart';

import 'package:untitled5/login_page.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final firestore = FirebaseFirestore.instance.collection('Users').snapshots();
  final FirebaseAuth auth = FirebaseAuth.instance;
  late User user;
  late String currentUId;
  late String currentEmail;
  @override
  Widget build(BuildContext context) {
    user = auth.currentUser!;
    currentUId = user.uid.toString();
    currentEmail = user.email.toString();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Profile",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blueGrey,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 4,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Unique User Id: " + user.uid,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Email Id: " + currentEmail,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                navigateSecondPage(ForgotPasswordPage());
              },
              child: Text(
                "Reset Password",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45),
              ),
            ),
            buildAccountOptionRow(context, "Language"),
            buildAccountOptionRow(context, "Privacy and security"),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.blueGrey,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 4,
            ),
            SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("Account activity", false),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.support_agent,
                  color: Colors.blueGrey,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Support",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 4,
            ),
            MaterialButton(
              onPressed: () async {
                final url = Uri.parse(
                  'https://www.instagram.com/spk.psy/',
                );
                if (await canLaunchUrl(url)) {
                  launchUrl(url, mode: LaunchMode.inAppWebView);
                } else {
                  // ignore: avoid_print
                  print("Can't open  $url");
                }
              },
              child: Row(
                children: [
                  Text(
                    "Soch Pe Kharoch",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black45),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image(
                      image: AssetImage("img/img_2.png"),
                      height: 30,
                      fit: BoxFit.fitWidth),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () async {
                final url = Uri.parse(
                  'tel:+91 9411310301',
                );
                if (await canLaunchUrl(url)) {
                  launchUrl(url, mode: LaunchMode.platformDefault);
                } else {
                  // ignore: avoid_print
                  print("Can't open  $url");
                }
              },
              child: Row(
                children: [
                  Text(
                    "Customer Care",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black45),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.call)
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: RichText(
                  text: TextSpan(
                      text: "",
                      style: TextStyle(color: Colors.grey[500], fontSize: 20),
                      children: [
                    TextSpan(
                        text: "Sign out",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => Loginpage()))
                  ])),
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
