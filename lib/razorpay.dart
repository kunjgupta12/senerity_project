import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:untitled5/gethelp.dart';
import 'package:untitled5/signup_page.dart';


class paymemnt extends StatefulWidget {
  paymemnt({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<paymemnt> {
  late var _razorpay;
  var amountController = TextEditingController();


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

    Navigator.push(context, MaterialPageRoute(builder: (context) => gethelp()));
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
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            CupertinoButton(
                color: Colors.grey,
                child: Text("Pay Amount 100 for 15 min"),
                onPressed: () {
                  ///Make payment

                    var options = {
                      'key': "rzp_test_ALdrxH7AP4NuvJ",

                      'amount': 10000,
                      'name': 'Serenity',
                      'description': 'Conference',
                      'timeout': 3000, // in seconds
                      'prefill': {
                        'contact': '8787878787',
                        'email': 'email',
                        'name':'kunj',
                      }
                    };
                    _razorpay.open(options);

                }
                ),
            CupertinoButton(
                color: Colors.grey,
                child: Text("Pay Amount 200 for 45 min"),
                onPressed: () {
                  ///Make payment

                  var options = {
                    'key': "rzp_test_ALdrxH7AP4NuvJ",

                    'amount': 20000,
                    'name': 'Serenity',
                    'description': 'Conference',
                    'timeout': 3000, // in seconds
                    'prefill': {
                      'contact': '8787878787',
                      'email': 'email',
                      'name':'kunj',
                    }
                  };
                  _razorpay.open(options);

                }
            ),
            CupertinoButton(
                color: Colors.grey,
                child: Text("Pay Amount 300 for 1 hr"),
                onPressed: () {
                  ///Make payment

                  var options = {
                    'key': "rzp_test_ALdrxH7AP4NuvJ",

                    'amount': 30000,
                    'name': 'Serenity',
                    'description': 'Conference',
                    'timeout': 3000, // in seconds
                    'prefill': {
                      'contact': '8787878787',
                      'email': 'email',
                    }
                  };
                  _razorpay.open(options);

                }
            ),

          ],
        ),
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
