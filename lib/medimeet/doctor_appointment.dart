import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/medimeet/product_itm.dart';

import '../community/dialog.dart';

final firestore =
    FirebaseFirestore.instance.collection('doctor details').snapshots();

class doctor extends StatefulWidget {
  doctor({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<doctor> {
  @override
  Widget build(BuildContext context) {
    double displayheight = MediaQuery.of(context).size.height;

    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        clipBehavior: Clip.hardEdge,
        backgroundColor: Colors.white,
        //   automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Text(
              'Video Call Appointment',
              style: TextStyle(
                  fontFamily: 'JosefinSans', fontSize: 20, color: Colors.black),
            ),
            IconButton(
                color: Colors.black,
                onPressed: () {
                  customShowDialog(context);
                  /*Navigator.push(context,
                MaterialPageRoute(builder: (context) => Scene()));*/
                },
                icon: Icon(
                  Icons.arrow_drop_down,
                )),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Popular Doctors',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
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
                              if (snapshot.hasError)
                                return Text(('Some error'));

                              return Expanded(
                                child: ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      DocumentSnapshot data =
                                          snapshot.data!.docs[index];
                                      return ListTile(
                                        title: ProductItem(
                                            email: data['email'],
                                            Degree: data['Degree'],
                                            name: data['name'],
                                            price: data['price'],
                                            Experience: data['Experience'],
                                            registraionnumber:
                                                data['registraionnumber'],
                                            image: data['image']),
                                      );
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
      ),
    );
  }
}
