import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:untitled5/Upload_Page.dart';
import 'package:untitled5/add_poll_page.dart';
import 'package:untitled5/login_page.dart';
import 'package:untitled5/nav_bar.dart';


import 'add_blog_page.dart';
import 'login_page.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final databaseReference = FirebaseDatabase.instance.ref().child('Posts');
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController searchController = TextEditingController();
  String search = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

debugShowCheckedModeBanner: false,


      home: Scaffold(


        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('New Blogs'),

          centerTitle: true,

          actions: [

            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPostScreen()));
                },
                child: Icon(Icons.add)),
            SizedBox(
              width: 20,
            ),
            InkWell(
                onTap: () {
                  auth.signOut().then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Loginpage()));
                    setState(() {
                      Loginpage;
                    });
                  });
                },
                child: Icon(Icons.logout_outlined)),

            InkWell(
              onTap: () {
               {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => profilepage()));

                }
              },
              child: Icon(Icons.adf_scanner),
            ),
            SizedBox(
              width: 20,

            ),
          ],
        ),

              body: Padding(

          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              TextFormField(
                controller: searchController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(300),
                  ),
                  hintText: 'Show only',
                  prefixIcon: Icon(Icons.search_outlined),
                  labelText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(300),
                  ),
                ),
                onChanged: (value) {
                  search = value;
                },
              ),

              Expanded(

                child: FirebaseAnimatedList(
                  query: databaseReference.child('Post List'),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    String tempTitle =
                        snapshot.child('pTitle').value.toString();
                    if (searchController.text.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: FadeInImage.assetNetwork(
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width * .9,
                                  height:
                                      MediaQuery.of(context).size.height * .4,
                                  placeholder: 'images/tohru.jpg',
                                  image: snapshot
                                      .child('pImage')
                                      .value!
                                      .toString(),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  snapshot.child('pTitle').value!.toString(),
                                  style: TextStyle(
                                      fontSize: 29,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black54,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,

                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  snapshot
                                      .child('pDescription')
                                      .value!
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                  color: Colors.black87),
                                ),
                              ),


                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (tempTitle
                        .toLowerCase()
                        .contains(searchController.text.toString())) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: FadeInImage.assetNetwork(
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  placeholder: 'images/tohru.jpg',
                                  image: snapshot
                                      .child('pImage')
                                      .value!
                                      .toString(),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  snapshot.child('pTitle').value!.toString(),
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  snapshot
                                      .child('pDescription')
                                      .value!
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),

                              SizedBox(
                                height: 10,
                              ),

                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
