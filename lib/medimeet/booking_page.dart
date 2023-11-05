import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled5/medimeet/button.dart';
import 'package:untitled5/medimeet/custom_appbar.dart';
import 'package:untitled5/medimeet/success.dart';
import 'package:intl/intl.dart';

User? user = auth.currentUser;
FirebaseAuth auth = FirebaseAuth.instance;

class BookingPage extends StatefulWidget {
  BookingPage(
      {super.key,
      required this.email,
      required this.name,
      required this.price,
      required this.registraionnumber});
  final String name;
  final String price;
  final String registraionnumber;
  final String email;
  @override
  State<BookingPage> createState() => _BookingPageState();
}

late var _razorpay;

class _BookingPageState extends State<BookingPage> {
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

    final selectedDate = _currentDay;
    final formattedDate = DateFormat('MMMM dd, yyyy').format(selectedDate);
    final selectedTime = (_currentIndex! + 9).toString() +
        (_currentIndex! + 9 > 11 ? "PM" : "AM");

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SuccessPage()));
    FirebaseFirestore.instance
        .collection('doctor details')
        .doc(widget.email)
        .collection('booking')
        .add({
      'date': formattedDate,
      'time': selectedTime,
      'user': user?.uid,
      'useremail': user?.email
    });
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

  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Appointment',
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                _tableCalendar(),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                ),
              ],
            ),
          ),
          _isWeekend
              ? SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    alignment: Alignment.center,
                    child: const Text(
                      'Weekend is not available, please select another date',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                            _timeSelected = true;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _currentIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: _currentIndex == index ? Colors.grey : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  _currentIndex == index ? Colors.white : null,
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: 8,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, childAspectRatio: 1.5),
                ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 80,
              ),
              child: Button(
                width: double.infinity,
                title: 'Make Appointment',
                onPressed: () {
                  final p = double.parse(widget.price) * 100;
                  String pp = p.toString();
                  var options = {
                    'key': "rzp_test_ALdrxH7AP4NuvJ",

                    'amount': pp,
                    'name': 'Serenity',
                    'description': 'Conference',
                    'timeout': 3000, // in seconds
                    'prefill': {
                      'contact': '8787878787',
                    }
                  };
                  _razorpay.open(options);
                },
                disable: _timeSelected && _dateSelected ? false : true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2024, 12, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: const CalendarStyle(
        todayDecoration:
            BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;

          //check if weekend is selected
          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      }),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _razorpay.clear();
    super.dispose();
  }
}
