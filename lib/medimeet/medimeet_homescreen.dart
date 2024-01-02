import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/drawer/action_audio.dart';
import 'package:untitled5/drawer/audio_video.dart';
import 'package:untitled5/medimeet/doctor_appointment.dart';
import 'package:untitled5/medimeet/doctor_audio.dart';

import '../community/dialog.dart';
import '../drawer/action_button..dart';
import '../drawer/expanded.dart';

class Medimeet extends StatefulWidget {
  const Medimeet({super.key});

  @override
  State<Medimeet> createState() => _MedimeetState();
}

class _MedimeetState extends State<Medimeet> {
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        clipBehavior: Clip.hardEdge,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        //   automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            customShowDialog(context);
          },

          child: Row(
            children: [
              SizedBox(width: displayWidth * .3),
              Text(
                'MediMeet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'JosefinSans',
                  fontSize: 19 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1 * ffem / fem,
                  color: Color(0xff000000),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                child: Container(
                  // line3FBw (129:381)
                  width: 9 * fem,
                  height: 5 * fem,
                  child: Image.asset(
                    'assets/page-1/images/line-3-Ni5.png',
                    width: 9 * fem,
                    height: 5 * fem,
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: Audio(children: [
        ActionButton_Audio(
          text: 'Video Call appointment',
            icon: 'assets/video.png',
            onPressed: () {
              ////  if(document.data().value[]){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => doctor()));
            }),
        ActionButton_Audio(
          text: 'Audio Call appointment',
          icon: 'assets/phone.png',
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => doctor_audio()));
          },
        ),
      ], distance: 80),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text(
                  "Revolutionize your healthcare experience with our groundbreaking doctor's appointment feature. Bid farewell to long queues and tedious phone calls by effortlessly scheduling your appointments through our user-friendly app. Access a wide network of renowned doctors and specialists, ready to provide you with personalized care. From routine check-ups to critical consultations, our app streamlines the entire process, putting your health at the forefront. Take charge of your well-being and enjoy the convenience of booking appointments at your fingertips. Trust in our reliable platform to connect you with exceptional healthcare professionals, ensuring that you receive the quality care you deserve. Embrace a new era of healthcare convenience and prioritize your health with our cutting-edge doctor's appointment feature.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SourceCodePro',
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Image.asset('assets/page-1/images/medimeet.png'),
                Text(
                  "Experience the freedom of choice with our flexible pricing feature for doctor's appointments. We believe that every individual deserves access to quality healthcare at a price that suits their needs. With our app, you have the power to select the doctor of your choice and even determine the price you are comfortable with. Our diverse network of healthcare professionals ensures that you find the right match. No more rigid pricing structures or hidden fees - take control of your healthcare journey and set your own budget. We empower you to prioritize your health without compromising your financial well-being. Discover a new level of affordability and convenience with our app's flexible pricing for doctor's appointments.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SourceCodePro',
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
      ),
    );
  }
}
