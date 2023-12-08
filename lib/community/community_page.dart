import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polls/flutter_polls.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled5/community/add_poll.dart';
import 'package:untitled5/community/add_post.dart';
import 'package:untitled5/community/dialog.dart';
import 'package:untitled5/community/postwrite.dart';
import 'package:untitled5/drawer/action_button..dart';
import 'package:untitled5/drawer/drawer.dart';
import 'package:untitled5/pro.dart';

import '../drawer/expanded.dart';

User? user = auth.currentUser;
FirebaseAuth auth = FirebaseAuth.instance;
final verified = FirebaseFirestore.instance
    .collection('verified')
    .doc(user?.uid)
    .snapshots();

final document = FirebaseFirestore.instance
    .collection('Users')
    .doc('CXvGTxT49NUoKi9gRt96ltvljz42')
    .get();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _vote(String pollId, String option) {
    FirebaseFirestore.instance.collection('polls').doc().update({
      'votes.$option': FieldValue.increment(1),
    });
  }

  final GlobalKey kunj = GlobalKey();
  var databaseReference = FirebaseDatabase.instance.ref().child('Posts');
  String datec = DateTime.now().microsecondsSinceEpoch.toString();
  final comment = TextEditingController();
  TextEditingController searchController = TextEditingController();
  String search = "";
  bool verified = true;
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      floatingActionButton: ExpandableFab(children: [
        ActionButton(
            icon: 'assets/f3.png',
            onPressed: () {
              ////  if(document.data().value[]){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreatePollPage()));
            }),
        ActionButton(
          icon: 'assets/f2.png',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewPostPage()));
          },
        ),
        ActionButton(
          icon: 'assets/f1.png',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewPostWrite()));
            print('add');
          },
        ),
      ], distance: 100),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // frame1JPB (129:378)
                margin:
                    EdgeInsets.fromLTRB(110 * fem, 0 * fem, 80 * fem, 1 * fem),
                child: TextButton(
                  onPressed: () {
                    customShowDialog(context);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: displayWidth,
                    height: 41 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // frame1mnZ (129:379)
                          width: 108 * fem,
                          height: double.infinity,

                          child: Center(
                            child: Text(
                              'Community',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'JosefinSans',
                                fontSize: 19 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // line3FBw (129:381)
                          width: 9 * fem,
                          height: 5 * fem,
                          child: Image.asset(
                            'assets/page-1/images/line-3-Ni5.png',
                            width: 9 * fem,
                            height: 5 * fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              /*  StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('verified')
                      .doc(user?.uid)
                      .snapshots(),
                  builder: (context, snapshot) {


                    var userDocument = snapshot.data;

                    if (userDocument?['verified'] == true.toString()) {
                   return   Text('verified');
                    } else
                  return    Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: GestureDetector(onTap:(){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => verify()));
                          },child: Text('Get Verified  by submitting document')),
                        ),

                      ],
                    ),
                  );
              //      return Container();

                  //  return Text('');
                  }),*/
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
                            return Card(
                              elevation: 1,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Column(
                                  children: [
                                    FlutterPolls(
                                      pollId: polls?[index].id.toString(),
                                      // hasVoted: hasVoted.value,
                                      // userVotedOptionId: userVotedOptionId.value,
                                      onVoted: (PollOption pollOption,
                                          int newTotalVotes) async {
                                        _vote(pollId!, pollOption.toString());
                                        await Future.delayed(
                                            const Duration(seconds: 1));
//_vote(pollId!, option),
                                        /// If HTTP status is success, return true else false
                                        return true;
                                      },
                                      // pollEnded: ,
                                      pollTitle: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'assets/page-1/images/ellipse-13-bg.png',
                                              width: 40,
                                              height: 40,
                                            ),
                                            Text(
                                              poll?['question'],
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      pollOptions: List<PollOption>.from(
                                        poll?['options'].map(
                                          (option) {
                                            var voteCount =
                                                poll['votes'][option] ?? 0;
                                            var a = PollOption(
                                                id: '1', //option['id'],
                                                title: TextButton(
                                                    onPressed: () {
                                                      _vote(pollId!, option);
                                                    },
                                                    child: Text(
                                                      option,
                                                      //  poll['votes'].toString(),
                                                      //option['title'],
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black),
                                                    )),
                                                votes: voteCount
                                                // 1 //option['votes'],
                                                );
                                            return a;
                                          },
                                        ),
                                      ),
                                      votedPercentageTextStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      metaWidget: Column(
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Image.asset(
                                                    'assets/page-1/images/expand-thread.png',
                                                    width: 20,
                                                    height: 20,
                                                  )),
                                              SizedBox(
                                                width: displayWidth * 0.5,
                                              ),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Image.asset(
                                                    'assets/page-1/images/share.png',
                                                    width: 20,
                                                    height: 20,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                            /* Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                child: ListTile(
                                  trailing:  IconButton(
                                      onPressed: () => (){},
                                      icon: Icon(Icons.how_to_vote)) ,
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
                                ),
                              ),
                            );*/
                          } else if (polls?[index].data()['type'] == "post") {
                            var poll = polls?[index].data();
                            var pollId = polls?[index].id;
                            poll?['votes'] ??= {};
                            return Card(
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Image.asset(
                                      'assets/page-1/images/ellipse-13-bg.png',
                                      width: 40,
                                      height: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(poll?['text']),
                                    ),
                                  ],
                                ),
                                subtitle: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/page-1/images/expand-thread.png',
                                          width: 20,
                                          height: 20,
                                        )),
                                    SizedBox(
                                      width: displayWidth * 0.57,
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/page-1/images/share.png',
                                          width: 20,
                                          height: 20,
                                        )),
                                  ],
                                ),
                              ),
                            );
                          } else if (polls?[index].data()['type'] ==
                              "post_image") {
                            var poll = polls?[index].data();
                            var pollId = polls?[index].id;
                            poll?['votes'] ??= {};
                            return Card(
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Image.asset(
                                      'assets/page-1/images/ellipse-13-bg.png',
                                      width: 40,
                                      height: 40,
                                    ),
                                    Text(poll?['text']),
                                  ],
                                ),
                                subtitle: Container(
                                    height: 200,
                                    child: Image.network(poll?['image_url'])),
                              ),
                            );
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
