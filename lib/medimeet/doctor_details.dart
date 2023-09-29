import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled5/medimeet/booking_page.dart';
import 'package:untitled5/medimeet/button.dart';
import 'package:untitled5/medimeet/custom_appbar.dart';
import 'package:untitled5/medimeet/product_itm.dart';

class DoctorDetails extends StatefulWidget {
  DoctorDetails(
      {super.key,
      required this.name,
      required this.price,
      required this.registrationnumber,
      required this.Experience,
      required this.Degree,
      required this.image});
  final String name;
  final String price;
  final String registrationnumber;
  final String Experience;
  final String Degree;
  final String image;
  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    final String kunj = widget.name.toString();
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Dr. ' + widget.name,
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
            },
            icon:
                FaIcon(isFav ? Icons.favorite_rounded : Icons.favorite_outline),
            color: Colors.red,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                CircleAvatar(
                  radius: 65.0,
                  backgroundImage: NetworkImage(widget.image),
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Dr. ' + kunj,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    widget.Degree,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    'Fortis Hospital',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          //AboutDoctor(),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: <Widget>[
                    InfoCard(
                      label: 'Price',
                      value: widget.price,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InfoCard(
                      label: 'Experiences',
                      value: widget.Experience,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InfoCard(
                      label: 'Registration number',
                      value: widget.registrationnumber,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'About Doctor',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  widget.price,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),

          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              child: Button(
                width: double.infinity,
                title: 'Book Appointment',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookingPage(
                                name: widget.name,
                                price: widget.price,
                                registraionnumber: widget.registrationnumber,
                              )));
                },
                disable: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.label, required this.value})
      : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black45,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
