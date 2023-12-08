import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled5/bottom_nav/nav_bar.dart';
import 'package:untitled5/medimeet/product_itm.dart';

import '../community/dialog.dart';

final firestore =
FirebaseFirestore.instance.collection('doctor details').snapshots();

class doctor_audio extends StatefulWidget {
  doctor_audio({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<doctor_audio> {
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width * 1.4;
    double displayheight = MediaQuery.of(context).size.height;
    final items = <Widget>[
      Image.asset(
        "img/community.png",
        height: displayheight * .05,
        width: displayWidth * .09,
      ),
      Image.asset(
        "img/SnapHelp.png",
        height: displayheight * .05,
        width: displayWidth * .09,
      ),
      Image.asset(
        "img/MediMeet.png",
        height: displayheight * .05,
        width: displayWidth * .09,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        clipBehavior: Clip.hardEdge,
        backgroundColor: Colors.white,
        //   automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Text(
              'Audio Call Appointment',
              style: TextStyle(
                  fontFamily: 'JosefinSans', fontSize: 20, color: Colors.black),
            ),
            IconButton(
                color: Colors.black,
                onPressed: () {
                  customShowDialog(context);
                },
                icon: Icon(
                  Icons.arrow_drop_down,
                )),
          ],
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        animationCurve: Curves.fastEaseInToSlowEaseOut,
        animationDuration: Duration(milliseconds: 200),
        color: Color.fromRGBO(255, 237, 237, 1),
        buttonBackgroundColor: Color.fromRGBO(49, 164, 153, 1),
        backgroundColor: Colors.transparent,
        height: displayheight * .085,
        onTap: (index) => setState(() {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => profilepage()));
        }),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: displayheight * .75,
                child: GestureDetector(
                  child: Column(
                    children: [
                      StreamBuilder<QuerySnapshot>(
                          stream: firestore,
                          builder: (BuildContext value,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting)
                              return CircularProgressIndicator();
                            if (snapshot.hasError) return Text(('Some error'));

                            return Expanded(
                              child: ListView.builder(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    DocumentSnapshot data =
                                    snapshot.data!.docs[index];
                                    return ProductItem(
                                        email: data['email'],
                                        Degree: data['Degree'],
                                        name: data['name'],
                                        price: data['price'],
                                        Experience: data['Experience'],
                                        registraionnumber:
                                        data['registraionnumber'],
                                        image: data['image']);
                                  }),
                            );
                          })
                    ],
                  ),
                ),
              )
              /*   Column(

                children: List.generate(10, (index) {
                  return const DoctorCard(
                    route: 'doc_details',
                  );
                }),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
