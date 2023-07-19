import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'doctor_appointment.dart';

class doctorslot extends StatefulWidget {

  const doctorslot({super.key});

  @override
  State<doctorslot> createState() => _doctorslotState();

}

class _doctorslotState extends State<doctorslot> {
  final mobilecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final firestore =
  FirebaseFirestore.instance.collection('slot book').snapshots();
  final fire=FirebaseFirestore.instance.collection('doctor details').snapshots();
  late var _razorpay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              SizedBox(
                height: 400,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(.2))
                    ]),
                child: TextFormField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                      hintText: 'Full Name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.deepOrangeAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                          BorderSide(color: Colors.white, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                          BorderSide(color: Colors.white, width: 1.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(.2))
                    ]),
                child: TextFormField(
                  controller: emailcontroller,
                  autovalidateMode: AutovalidateMode.always,

                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Email Address',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.deepOrangeAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                          BorderSide(color: Colors.white, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                          BorderSide(color: Colors.white, width: 1.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(.2))
                    ]),
                child: TextFormField(
                  controller: mobilecontroller,
                  autovalidateMode: AutovalidateMode.always,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Contact number',
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.deepOrangeAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                          BorderSide(color: Colors.white, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                          BorderSide(color: Colors.white, width: 1.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(

                style: ButtonStyle(

                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        )
                    )
                ),

                onPressed: () {
                  CollectionReference collref =
                  FirebaseFirestore.instance.collection('slot details');
                  collref.add({
                    'name': namecontroller.text,
                    'email': emailcontroller.text,
                    'mobile': mobilecontroller.text,
                  });
                  if (namecontroller.text != "" &&
                      emailcontroller.text != "" &&
                      mobilecontroller.text != "") {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => doctor(),),);
                  }
                },

                child: Text('Submit',style: TextStyle(
                  fontSize: 20,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
