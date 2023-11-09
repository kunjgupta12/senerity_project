import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled5/community/add_poll.dart';
import 'package:untitled5/community/add_post.dart';
import 'package:untitled5/community/dialog.dart';
import 'package:untitled5/community/post.dart';
import 'package:untitled5/drawer/action_button..dart';
import 'package:untitled5/drawer/drawer.dart';
import 'package:untitled5/pro.dart';

import '../drawer/expanded.dart';

User? user = auth.currentUser;
FirebaseAuth auth = FirebaseAuth.instance;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _vote(String pollId, String option) {
    FirebaseFirestore.instance.collection('polls').doc(pollId).update({
      'votes.$option': FieldValue.increment(1),
    });
  }

  final GlobalKey kunj = GlobalKey();
  var databaseReference = FirebaseDatabase.instance.ref().child('Posts');
  String datec = DateTime.now().microsecondsSinceEpoch.toString();
  final comment = TextEditingController();
  TextEditingController searchController = TextEditingController();
  String search = "";
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        clipBehavior: Clip.hardEdge,
        backgroundColor: Colors.white,
        //   automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(width: displayWidth * .25),
            const Text(
              'Community',
              style: TextStyle(
                  fontFamily: 'JosefinSans', fontSize: 25, color: Colors.black),
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
      floatingActionButton: ExpandableFab(children: [
        ActionButton(
          icon: const Icon(
            Icons.poll,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreatePollPage()));
          },
        ),
        ActionButton(
          icon: const Icon(
            Icons.post_add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewPostPage()));
          },
        ),
        ActionButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            print('add');
          },
        ),
      ], distance: 120),
      /* FloatingActionButton(
        clipBehavior: Clip.hardEdge,
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreatePollPage()));
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ), */
      // This trailing comma makes,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              cursorColor: Colors.blueGrey,
              controller: searchController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(300),
                ),
                hintText: 'Show only',
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: Colors.blueGrey,
                ),
                labelText: 'Search',
                labelStyle: const TextStyle(color: Colors.blueGrey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(300),
                ),
              ),
              onChanged: (value) {
                search = value;
              },
            ),
            Container(
              child: Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('polls')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }
                    final polls = snapshot.data?.docs;

                    // Display the polls and their options, along with vote buttons
                    return ListView.builder(
                      itemCount: polls?.length,
                      itemBuilder: (context, index) {
                        if (polls?[index].data()['type'] == "polls") {
                          var poll = polls?[index].data();
                          var pollId = polls?[index].id;
                          poll?['votes'] ??= {};
                          return ListTile(
                            title: Text(poll?['question']),
                            subtitle: Column(
                              children: poll?['options'].map<Widget>((option) {
                                var voteCount = poll['votes'][option] ?? 0;
                                return Row(
                                  children: [
                                    Text('$option: $voteCount votes'),
                                    IconButton(
                                        onPressed: () => _vote(pollId!, option),
                                        icon: Icon(Icons.how_to_vote))
                                  ],
                                );
                              }).toList(),
                            ),
                          );
                        } else if (polls?[index].data()['type'] == "post") {
                          var poll = polls?[index].data();
                          var pollId = polls?[index].id;
                          poll?['votes'] ??= {};
                          return ListTile(
                            title: Text(poll?['text']),
                          );
                        } else if (polls?[index].data()['type'] ==
                            "post_image") {
                          var poll = polls?[index].data();
                          var pollId = polls?[index].id;
                          poll?['votes'] ??= {};
                          return ListTile(
                              title: Text(poll?['text']),
                              subtitle: Container(
                                  height: 200,
                                  child: Image.network(poll?['image_url'])));
                        }
                      },
                    );
                  },
                ),
              ),
            ),
            /*  Expanded(
              child: FirebaseAnimatedList(
                query: databaseReference.child('Post List'),
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  String tempTitle = snapshot.child('pTitle').value.toString();
                  String description =
                      snapshot.child('pDescription').value.toString();
                  String img = snapshot.child('pImage').value!.toString();

                  if (searchController.text.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            //border: Border.all(width: 2),
                            border: Border.all(
                                style: BorderStyle.solid,
                                strokeAlign: BorderSide.strokeAlignCenter),
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                snapshot.child('pTitle').value!.toString(),
                                style: const TextStyle(
                                  fontFamily: 'SourceCodePro',
                                  fontSize: 29,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                snapshot
                                    .child('pDescription')
                                    .value!
                                    .toString(),
                                style: const TextStyle(
                                    fontFamily: 'SourceCodePro',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: FadeInImage.assetNetwork(
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width * .9,
                                height: MediaQuery.of(context).size.height * .4,
                                placeholder: 'images/tohru.jpg',
                                image:
                                    snapshot.child('pImage').value!.toString(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            /* TextButton(
                              child: Text(
                                "Comment:" +
                                    snapshot
                                        .child("pcomment")
                                        .value!
                                        .toString(),
                                style: TextStyle(
                                  fontFamily: 'SourceCodePro',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,
                                ),
                              ),
                              onPressed: () {
                                showMyDialogReply(
                                    snapshot.child("pId").value.toString());
                              },
                            ),*/
                            /*       Text(
                              "Comment:" +
                                  snapshot.child("pcomment").value!.toString(),
                              style: TextStyle(
                                fontFamily: 'SourceCodePro',
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),*/
                            SizedBox(
                              //  height: displayheight,
                              width: displayWidth * .9,

                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Image.asset(
                                          "img/Expand thread.png",
                                          height: displayheight * .023,
                                          width: 30,
                                        ),
                                        iconSize: 1,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => expand(
                                                      tempTitle: tempTitle,
                                                      description: description,
                                                      img: img)));
                                          /*   showMyDialog(snapshot
                                              .child("pId")
                                              .value
                                              .toString());*/
                                        },
                                      ),
                                      const Text(
                                        'Expand Thread',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'SourceCodePro',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: displayWidth * .03,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                          icon: Image.asset(
                                            color: _hasBeenPressed
                                                ? Colors.blue
                                                : Colors.black,
                                            "img/Important.png",
                                            height: displayheight * .023,
                                            width: 30,
                                          ),
                                          iconSize: 1,
                                          onPressed: () {
                                            setState(() {
                                              _hasBeenPressed =
                                                  !_hasBeenPressed;
                                            });
                                            /*  final postRef = FirebaseDatabase
                                                .instance
                                                .ref()
                                                .child('Posts');
                                            postRef
                                                .child('Post List')
                                                .child(tempTitle)
                                                .child("comment")
                                                .update({"value": 1});*/
                                          }),
                                      const Text(
                                        'Important',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'SourceCodePro',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: displayWidth * .03,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Image.asset(
                                          "img/share.png",
                                          height: displayheight * .023,
                                          width: 30,
                                        ),
                                        onPressed: () {},
                                      ),
                                      const Text(
                                        'Share',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'SourceCodePro',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
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
                                height: MediaQuery.of(context).size.height * 1,
                                placeholder: 'images/tohru.jpg',
                                image:
                                    snapshot.child('pImage').value!.toString(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                snapshot.child('pTitle').value!.toString(),
                                style: const TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
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
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            /*        Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  snapshot
                                      .child('pComment')
                                      .value!
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ),
                              ),*/
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),*/
          ],
        ),
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

  Future<void> showMyDialog(String date) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Comment"),
            content: Container(
              child: TextField(
                controller: comment,
                decoration: InputDecoration(hintText: "Comment"),
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
                        .set({user?.uid: comment.text}).then((value) {
                      toastMessage("Commented");
                    });
                  },
                  child: Text("Comment"))
            ],
          );
        });
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
