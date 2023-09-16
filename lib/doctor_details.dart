import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled5/button.dart';
import 'package:untitled5/custom_appbar.dart';
import 'package:untitled5/product_itm.dart';

class DoctorDetails extends StatefulWidget {
  DoctorDetails({
    super.key,
    required this.productName,
    required this.productPrice,
  });
  final String productName;
  final String productPrice;
  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    final String kunj = widget.productName.toString();
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Dr. ' + widget.productName,
        icon: FaIcon(Icons.arrow_back_ios_new),
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
                  backgroundImage: AssetImage('img/profile.png'),
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
                    'MBBS(AIIMS Delhi), MRCP(AIIMS Delhi)',
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
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: <Widget>[
                    InfoCard(
                      label: 'Price',
                      value: widget.productPrice,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InfoCard(
                      label: 'Experiences',
                      value: '11 years',
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InfoCard(
                      label: 'Rating',
                      value: '4.6',
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
                  'Dr. Nishant is an experienced Dentist Specialist at Fortis, graduated since 2008, and completed his/her training at Sungai Buloh General Hospital.',
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
            child: Button(
              width: displayWidth * .85,
              title: 'Book Appointment',
              onPressed: () {
                Navigator.of(context).pushNamed('booking_page');
              },
              disable: false,
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
