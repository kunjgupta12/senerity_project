import 'package:flutter/material.dart';

Future<void> customShowDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(255, 237, 237, 1),
          content: Container(
            decoration: const BoxDecoration(

                borderRadius: BorderRadius.all(Radius.circular(150))
            ),
            height: 200,
            width: 200,
            child: Column(

              children: [
                TextButton(

                  onPressed: () {}, child: Text('My Profile', style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),),
                ),
                TextButton(

                  onPressed: () {}, child: Text('Support', style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),),
                ),
                TextButton(

                  onPressed: () {},
                  child: Text('Privacy Policy', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),),
                ),
                TextButton(

                  onPressed: () {},
                  child: Text('Terms of Service', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),),
                ),
              ],
            ),
          ),

        );
      });
}