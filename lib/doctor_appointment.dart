import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/doctor_card.dart';
import 'package:untitled5/drawer.dart';
import 'package:untitled5/appointment_status.dart';

class doctor extends StatefulWidget {
  doctor({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<doctor> {
  @override
  Widget build(BuildContext context) {
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
          'MediMeet',
          style: TextStyle(
              fontFamily: 'JosefinSans', fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /*   const Text(
                  'Todays Appointment',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const AppointmentCard(),
                const SizedBox(
                  height: 25,
                ),*/
                const Text(
                  'Popular Doctors',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                DoctorCard(),
                /*   Column(

                  children: List.generate(10, (index) {
                    return const DoctorCard(
                      route: 'doc_details',
                    );
                  }),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
