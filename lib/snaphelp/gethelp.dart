import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:untitled5/bottom_nav/nav_bar.dart';
import 'package:untitled5/snaphelp/signaling..dart';

int _remainingTime = 900; //initial time in seconds
late Timer _timer;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(gethelp());
}

class gethelp extends StatefulWidget {
  const gethelp({super.key});

  @override
  State<gethelp> createState() => _gethelpState();
}

class _gethelpState extends State<gethelp> {
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
    _startTimer();
    room();
    currentUId = user.uid.toString();
    signaling.openUserMedia(_localRenderer, _remoteRenderer);
    signaling.onAddRemoteStream = ((stream) {
      _remoteRenderer.srcObject = stream;
      setState(() {});
    });
    Timer(Duration(minutes: 15), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => profilepage()));
    });
    super.initState();
  }

  void _startTimer() {
    //   _timer.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    var db = FirebaseFirestore.instance;
    var roomRef = db.collection('rooms').doc(roomId);
    roomRef.delete();
    _remainingTime;
    _startTimer();
    signaling.hangUp(_localRenderer);
    super.dispose();
  }

  void senddata() {
    CollectionReference collref =
        FirebaseFirestore.instance.collection('Users joined ');

    collref.add({
      'uid': user.uid.toString(),
    });
  }

  Future<void> room() async {
    roomId = await signaling.createRoom(_remoteRenderer);
    textEditingController.text = roomId!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Conference',
          style: TextStyle(),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Text("Remaining time: $_remainingTime seconds"),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      signaling.openUserMedia(_localRenderer, _remoteRenderer);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black87),
                    ),
                    icon: Icon(Icons.mic),
                  ),
                  Text(
                    "Open microphone",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                children: [
                  IconButton(
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
                    icon: Icon(Icons.refresh),
                  ),
                  Text(
                    "Join room",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      signaling.hangUp(_localRenderer);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black87),
                    ),
                    icon: Icon(Icons.call_end_sharp),
                  ),
                  Text(
                    "Hangup",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
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
                  Expanded(
                      child: RTCVideoView(
                    _localRenderer,
                    mirror: true,
                  )),
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
                Text(" Room id : "),
                Flexible(
                  child: Text(
                    textEditingController.text,
                  ),
                )
              ],
            ),
          ),
          //Text(user.uid),
          SizedBox(height: 8)
        ],
      ),
    );
  }
}
