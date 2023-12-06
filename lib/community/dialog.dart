import 'package:flutter/material.dart';
import 'package:untitled5/drawer/T@C.dart';
import 'package:untitled5/drawer/privacy-policy.dart';
import 'package:untitled5/pro.dart';
import 'package:untitled5/support.dart';

Future<void> customShowDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          backgroundColor: Color.fromRGBO(255, 237, 237, 1),
          content: Container(
            height: 200,
            width: 200,
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Scene()));
                  },
                  child: Text(
                    'My Profile',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Scenee()));
                  },
                  child: Text(
                    'Support',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => privacy_policy()));
                  },
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => terms_condition()));
                  },
                  child: Text(
                    'Terms of Service',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
