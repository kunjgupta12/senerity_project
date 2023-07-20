import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled5/community_page.dart';
import 'package:untitled5/roundbutton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';



class AddPostScreenn extends StatefulWidget {
  const AddPostScreenn({Key? key}) : super(key: key);

  @override
  State<AddPostScreenn> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreenn> {
  bool showSpinner = false;
  final postRef = FirebaseDatabase.instance.ref().child('Posts');
  FirebaseStorage storage = FirebaseStorage.instance;

  FirebaseAuth _auth = FirebaseAuth.instance;



  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  void dialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Container(
              height: 120,
              child: Column(
                children: [

                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Comment'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              children: [

                SizedBox(
                  height: 30,
                ),
                Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: titleController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Comment',
                            hintText: 'Suggest',
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(
                                color: Colors.grey, fontWeight: FontWeight.normal),
                            labelStyle: TextStyle(
                                color: Colors.grey, fontWeight: FontWeight.normal),
                          ),

                          validator: (value) {
                            return value!.isEmpty ? 'Comment?' : null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),

                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                RoundButton(
                    title: 'Post',
                    onPress: () async {
                      setState(() {
                        showSpinner = true;
                      });

                      try {
                        int date = DateTime.now().microsecondsSinceEpoch;

                        Reference ref = FirebaseStorage.instance
                            .ref('/blog_app_firebase/$date');

                        final User? user = _auth.currentUser;

                        postRef.child('Post List').child(date.toString()).set({


                          'pComment': descriptionController.text.toString(),


                        }).then((value) {
                          toastMessage('Post published');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                          setState(() {
                            showSpinner = false;
                          });
                        }).onError((error, stackTrace) {
                          toastMessage(error.toString());
                          setState(() {
                            showSpinner = false;
                          });
                        });
                      } catch (e) {
                        setState(() {
                          showSpinner = false;
                        });
                        toastMessage(e.toString());
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);
  }
}
