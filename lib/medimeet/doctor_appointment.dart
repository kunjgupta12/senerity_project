import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:untitled5/drawer/drawer.dart';

import 'package:untitled5/medimeet/product_itm.dart';

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
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'MediMeet',
          style: TextStyle(
              fontFamily: 'JosefinSans', fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
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
