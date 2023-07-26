import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:untitled5/doctor_appointment.dart';
import 'package:untitled5/email_auth.dart';
import 'package:untitled5/nav_bar.dart';

class slotsbooking extends StatefulWidget {
  slotsbooking({super.key});

  @override
  State<slotsbooking> createState() => _slotsbookingState();
}

class _slotsbookingState extends State<slotsbooking> {
  late User user;
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String currentUId;
  late String currentEmail;
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();

  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slot booking'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 100,
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
                    label: Text("Date")),
              ),
              SizedBox(
                height: 100,
              ),
              TextField(
                controller: _time,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    suffixIcon: InkWell(
                      child: const Icon(
                        Icons.timer_outlined,
                      ),
                      onTap: () async {
                        final TimeOfDay? slectedTime = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());

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
                    label: Text("Time")),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 55),
                  ),
                  // onPressed: showNotification,
                  onPressed: () {
                    user = auth.currentUser!;

                    CollectionReference collref =
                        FirebaseFirestore.instance.collection('bookings');
                    collref.add({
                      'date': _date.text,
                      'time': _time.text,
                      'uid': user.uid.toString(),
                    });
                    if (_date.text != "" && _time.text != "") {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => profilepage(),
                        ),
                      );
                    }
                  },
                  child: Text("Book")),
            ],
          ),
        ),
      ),
    );
  }
}
