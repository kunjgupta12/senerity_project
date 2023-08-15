import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:untitled5/nav_bar.dart';
import 'package:untitled5/signaling..dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(gethelp30());
}

class gethelp30 extends StatefulWidget {
  const gethelp30({super.key});

  @override
  State<gethelp30> createState() => _gethelpState();
}

class _gethelpState extends State<gethelp30> {
  var _razorpay = Razorpay();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late User user;
  late String currentUId;
  late String currentEmail;
  Signaling signaling = Signaling();
  RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  String? roomId;
  TextEditingController textEditingController = TextEditingController(text: '');

  @override
  void initState() {
    _localRenderer.initialize();
    _remoteRenderer.initialize();
    user = auth.currentUser!;
    currentUId = user.uid.toString();

    Timer(Duration(
        minutes: 30), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => profilepage()));

      signaling.onAddRemoteStream = ((stream) {
        _remoteRenderer.srcObject = stream;
      });
    });
    super.initState();
  }

  void senddata() {
    CollectionReference collref =
    FirebaseFirestore.instance.collection('Users joined ');

    collref.add({
      'uid': user.uid.toString(),
    });
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  signaling.openUserMedia(_localRenderer, _remoteRenderer);
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.black87),
                ),
                child: Text(
                  "Open camera & microphone for 30min",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () async {
                  roomId = await signaling.createRoom(_remoteRenderer);
                  textEditingController.text = roomId!;
                  setState(() {});
                  senddata();
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.black87),
                ),
                child: Text(
                  "Create room",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  // Add roomId
                  signaling.joinRoom(
                    textEditingController.text.trim(),
                    _remoteRenderer,
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.black87),
                ),
                child: Text(
                  "Join room",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  signaling.hangUp(_localRenderer);
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.black87),
                ),
                child: Text(
                  "Hangup",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
          SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: RTCVideoView(_localRenderer, mirror: true)),
                  Expanded(child: RTCVideoView(_remoteRenderer)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Join the following Room: "),
                Flexible(
                  child: TextFormField(
                    controller: textEditingController,
                  ),
                )
              ],
            ),
          ),
          Text(user.uid),
          SizedBox(height: 8)
        ],
      ),
    );
  }
}
