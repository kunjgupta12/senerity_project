import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class doctor extends StatefulWidget {
  doctor({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<doctor> {
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();

  DateTime dateTime = DateTime.now();
  final firestore =
      FirebaseFirestore.instance.collection('doctor details').snapshots();
  late bool m;
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

    m == true;
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    m = false;
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
      appBar: AppBar(
        title: Text('Book Doctor Appointment',
        ),
        backgroundColor: Colors.blueGrey,
      ),
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
                            horizontalTitleGap: 100,
                            title: SelectableText(
                              "Dr." +
                                  snapshot.data!.docs[index]['name'].toString(),
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 30,
                              ),
                            ),
                            subtitle: Column(children: [
                              Text(
                                'Email:' +
                                    snapshot.data!.docs[index]['email']
                                        .toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Price:' +
                                    snapshot.data!.docs[index]['price']
                                        .toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              TextField(
                                controller: _date,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    suffixIcon: InkWell(
                                      child: Icon(Icons.date_range),
                                      onTap: () async {
                                        final DateTime? newlySelectedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: dateTime,
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2095),
                                        );

                                        if (newlySelectedDate == null) {
                                          return;
                                        }

                                        setState(() {
                                          dateTime = newlySelectedDate;
                                          _date.text =
                                              "${dateTime.year}/${dateTime.month}/${dateTime.day}";
                                        });
                                      },
                                    ),
                                    label: Text("Enter Date")),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: _time,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    suffixIcon: InkWell(
                                      child: const Icon(
                                        Icons.lock_clock,
                                      ),
                                      onTap: () async {
                                        final TimeOfDay? slectedTime =
                                            await showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now());

                                        if (slectedTime == null) {
                                          return;
                                        }

                                        _time.text =
                                            "${slectedTime.hour}:${slectedTime.minute}:${slectedTime.period.toString()}";

                                        DateTime newDT = DateTime(
                                          dateTime.year,
                                          dateTime.month,
                                          dateTime.day,
                                          slectedTime.hour,
                                          slectedTime.minute,
                                        );
                                        setState(() {
                                          dateTime = newDT;
                                        });
                                      },
                                    ),
                                    label: Text("Enter Time")),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: CupertinoButton(
                                    color: Colors.grey,
                                    child: Text("Book  Appointment"),
                                    onPressed: () {
                                      ///Make payment
                                      if (_date.text != "" &&
                                          _time.text != "") {
                                        var options = {
                                          'key': "rzp_test_ALdrxH7AP4NuvJ",

                                          'amount': (double.parse(snapshot
                                                  .data!.docs[index]['price'])
                                              .toString()),
                                          'name': 'Serenity',
                                          'description': 'Conference',
                                          'timeout': 3000, // in seconds

                                          'prefill': {
                                            'contact': '8787878787',
                                            'email': 'email',
                                          }
                                        };
                                        _razorpay.open(options);

                                        String kunj =
                                            snapshot.data!.docs[index].id;
                                        final doc = FirebaseFirestore.instance
                                            .collection('doctor details')
                                            .doc(kunj);
                                        if ( m=true) {
                                          doc.update({
                                            'date': _date.text,
                                            'time': _time.text,
                                          });
                                        }
                                      }
                                    }),
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
