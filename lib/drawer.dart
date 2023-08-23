import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/login_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ForgotPasswordPage.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore =
        FirebaseFirestore.instance.collection('Users').snapshots();
    final FirebaseAuth auth = FirebaseAuth.instance;
    late User user;
    late String currentUId;
    late String currentEmail;

    user = auth.currentUser!;
    currentUId = user.uid.toString();
    currentEmail = user.email.toString();
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        //padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Text(
              "Unique User Id: " + user.uid,
            ),
          ),
          Text(
            "Email Id: " + currentEmail,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black45),
          ),
          ListTile(
            leading: Image.asset(
              "img/My Profile.png",
              height: 40,
              width: 45,
            ),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Image.asset(
              "img/Security.png",
              height: 40,
              width: 45,
            ),
            title: const Text('Security'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Image.asset(
              "img/support.png",
              height: 40,
              width: 45,
            ),
            title: const Text('Support'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Image.asset(
              "img/Privacy policy.png",
              height: 40,
              width: 45,
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
              width: 45,
            ),
            title: const Text('Terms of service'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.lock_reset,
            ),
            title: const Text('Reset Password'),
            onTap: () {
              //    navigateSecondPage(ForgotPasswordPage());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ForgotPasswordPage()));
            },
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
            height: 120,
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
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
    );
  }
}
