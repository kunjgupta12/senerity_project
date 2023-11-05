import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

User? user = auth.currentUser;
FirebaseAuth auth = FirebaseAuth.instance;

var databaseReference = FirebaseDatabase.instance.ref().child('Posts');
String datec = DateTime.now().microsecondsSinceEpoch.toString();
final comment = TextEditingController();

class expand extends StatefulWidget {
  const expand(
      {required this.tempTitle,
      required this.description,
      required this.img,
      super.key});
  final String tempTitle;
  final String description;
  final String img;
  @override
  State<expand> createState() => _expandState();
}

class _expandState extends State<expand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Text(widget.img),
          Center(child: Text(widget.tempTitle)),
          Image(image: NetworkImage(widget.img)),
        ],
      ),
    );
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  Future<void> showMyDialogReply(String date) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Reply"),
            content: Container(
              child: TextField(
                controller: comment,
                decoration: const InputDecoration(hintText: "Rply"),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    databaseReference
                        .child('Post List')
                        .child(date)
                        .child('pcomment')
                        .child(datec)
                        .child('reply')
                        .set({user?.uid: comment.text}).then((value) {
                      toastMessage("Commented");
                    });
                  },
                  child: Text("Comment"))
            ],
          );
        });
  }
}
