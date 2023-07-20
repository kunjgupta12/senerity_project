import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:untitled5/gethelp.dart';
import 'package:untitled5/signup_page.dart';

import 'doctor_slot.dart';

class doctor extends StatefulWidget {
  doctor({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<doctor> {
  final firestore =
      FirebaseFirestore.instance.collection('doctor details').snapshots();
  late var _razorpay;

  @override
  void initState() {
    // TODO: implement initState
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);

    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds

    Navigator.push(context, MaterialPageRoute(builder: (context) =>  doctorslot()));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment Fail");


  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    @override
    void dispose() {
      super.dispose();

      _razorpay.clear();
    }

    var options = {
      "key": "empty",
      "amount": 'empty',
      "name": 'empty',
      "Description": 'empty',
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;


    return Scaffold(
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: firestore,
              builder:
                  (BuildContext value, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return CircularProgressIndicator();
                if (snapshot.hasError) return Text(('Some error'));

                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(

                            horizontalTitleGap: 10,
                            title: SelectableText(
                              snapshot.data!.docs[index]['name'].toString(),
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 30,
                              ),
                            ),
                            subtitle: Row(children: [
                              Text(
                                snapshot.data!.docs[index]['email'].toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),


                              SizedBox(
                                height: 100,
                              ),
                              Container(
                                child: Center(
                                  child: CupertinoButton(
                                      color: Colors.grey,
                                      child: Text("Book  Appointment"),
                                      onPressed: () {
                                        ///Make payment

                                        var options = {
                                          'key': "rzp_test_ALdrxH7AP4NuvJ",

                                          'amount': (double.parse(snapshot.data!.docs[index]['price']).toString()),
                                          'name': 'Serenity',
                                          'description': 'Conference',
                                          'timeout': 3000, // in seconds
                                          'prefill': {
                                            'contact': '8787878787',
                                            'email': 'email',
                                          }
                                        };
                                        _razorpay.open(options);
                                      }),
                                ),
                              ),
                            ]),
                          ),
                        );
                      }),
                );
              }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _razorpay.clear();
    super.dispose();
  }
}
