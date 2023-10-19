import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:untitled5/drawer/drawer.dart';
import 'package:untitled5/snaphelp/gethelp.dart';
import 'package:untitled5/snaphelp/gethelp_30.dart';
import 'package:untitled5/auth/signup_page.dart';

int value = 0;

class paymemnt extends StatefulWidget {
  paymemnt({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<paymemnt> {
  Card buildCard() {
    var heading = 'Assistance';
    var subheading = 'Time: 15mins';
    var cardImage = NetworkImage(
        'https://contenthub-static.grammarly.com/blog/wp-content/uploads/2021/06/informational-interviews-760x406.jpeg');
    var supportingText = 'Quick support from our end for 15minutes...';
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(
                heading,
                style: TextStyle(
                  fontFamily: 'SourceCodePro',
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
              subtitle: Text(
                subheading,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(heading),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Option 1"),
                              ],
                            ),
                            actions: [
                              MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Close")),
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.help)),
            ),
            Container(
              height: 200.0,
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                supportingText,
                style: TextStyle(
                  color: Colors.black,

                  // fontSize: 5,
                ),
              ),
            ),
            ButtonBar(
              children: [
                TextButton(
                  child: Text(
                    'BOOK',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      // fontSize: 10,
                    ),
                  ),
                  onPressed: () {
                    value = 6900;
                    var options = {
                      'key': "rzp_test_ALdrxH7AP4NuvJ",

                      'amount': value,
                      'name': 'Serenity',
                      'description': 'Conference',
                      'timeout': 3000, // in seconds
                      'prefill': {
                        'contact': '8787878787',
                      }
                    };
                    _razorpay.open(options);
                  },
                ),
              ],
            )
          ],
        ));
  }

  Card buildCard30min() {
    var heading = 'Guidance';
    var subheading = 'Time: 30mins';
    var cardImage = NetworkImage(
        'https://contenthub-static.grammarly.com/blog/wp-content/uploads/2023/07/How-to-Write-an-Instagram-Caption-760x400.png');
    var supportingText = 'Guidance and  support from our end for 30minutes...';
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(
                heading,
                style: TextStyle(
                  fontFamily: 'SourceCodePro',
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
              subtitle: Text(
                subheading,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(heading),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Option 1"),
                              ],
                            ),
                            actions: [
                              MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Close")),
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.help)),
            ),
            Container(
              height: 200.0,
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(supportingText),
            ),
            ButtonBar(
              children: [
                TextButton(
                  child: Text(
                    'BOOK',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      // fontSize: 10,
                    ),
                  ),
                  onPressed: () {
                    value = 12900;
                    var options = {
                      'key': "rzp_test_ALdrxH7AP4NuvJ",

                      'amount': value,
                      'name': 'Serenity',
                      'description': 'Conference',
                      'timeout': 3000, // in seconds
                      'prefill': {
                        'contact': '8787878787',
                      }
                    };
                    _razorpay.open(options);
                  },
                ),
              ],
            )
          ],
        ));
  }

  Card buildCard1hour() {
    var heading = 'Support';
    var subheading = 'Time: 60mins';
    var cardImage = NetworkImage(
        'https://contenthub-static.grammarly.com/blog/wp-content/uploads/2023/08/Best-AI-Prompts-for-Writing-2-760x400.png');
    var supportingText = 'Complete support from our end for 1 hour...';
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(
                heading,
                style: TextStyle(
                  fontFamily: 'SourceCodePro',
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
              subtitle: Text(
                subheading,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(heading),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Option 1"),
                              ],
                            ),
                            actions: [
                              MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Close")),
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.help)),
            ),
            Container(
              height: 200.0,
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(supportingText),
            ),
            ButtonBar(
              children: [
                TextButton(
                  child: Text(
                    'BOOK',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      // fontSize: 10,
                    ),
                  ),
                  onPressed: () {
                    value = 17900;
                    var options = {
                      'key': "rzp_test_ALdrxH7AP4NuvJ",

                      'amount': value,
                      'name': 'Serenity',
                      'description': 'Conference',
                      'timeout': 3000, // in seconds
                      'prefill': {
                        'contact': '8787878787',
                      }
                    };
                    _razorpay.open(options);
                  },
                ),
              ],
            )
          ],
        ));
  }

  late var _razorpay;
  var amountController = TextEditingController();
  int index = 1;

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
    if (value == 6900) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => gethelp()));
    }
    if (value == 12900) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => gethelp30()));
    }
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
          'SnapHelp',
          style: TextStyle(
              fontFamily: 'JosefinSans', fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text(

                  "Experience the power of instant connection and personalized support at your fingertips. Need a shoulder to lean on? Our trained officials are just a call away. ready to lend you their expertise and compassionate ear. Whether you're seeking guidance, a friendly conversation, or a mini-counseling session, we've got you covered. Dive into a world of convenient, confidential, and empowering communication, right within our app Break free from limitations and embrace the freedom to reach out whenever you need, knowing that our dedicated team is here to uplift your spirits and empower your journey towards emotional well-being",textAlign:   TextAlign.center,
                  style: TextStyle(

                    fontFamily: 'SourceCodePro',
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 40,),
                Text("Pocket Friendly Options" , style: TextStyle(

                  fontFamily: 'JosefinSans',
                  color: Colors.black,

                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),),
                SizedBox(height: 10,),
                buildCard(),
                buildCard30min(),
                buildCard1hour(),
              ],
            )),
        height: size.height,
        width: size.width,
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
