import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled5/auth/ForgotPasswordPage.dart';
import 'package:untitled5/support.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: double.infinity,
          child: Container(
            // myprofileqVb (17:79)
            padding: EdgeInsets.fromLTRB(2 * fem, 33 * fem, 0 * fem, 0 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(26 * fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // frame1JPB (129:378)
                  margin: EdgeInsets.fromLTRB(
                      110 * fem, 0 * fem, 112 * fem, 82 * fem),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          9.5 * fem, 0 * fem, 9.5 * fem, 0 * fem),
                      width: double.infinity,
                      height: 41 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // frame1mnZ (129:379)
                            width: 108 * fem,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                            ),
                            child: Center(
                              child: Text(
                                'My Profile',
                                textAlign: TextAlign.center,
                                /* style: SafeGoogleFont (
                                  'Josefin Sans',
                                  fontSize: 19*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1*ffem/fem,
                                  color: Color(0xff000000),
                                ),*/
                              ),
                            ),
                          ),
                          Container(
                            // line3FBw (129:381)
                            width: 9 * fem,
                            height: 5 * fem,
                            child: Image.asset(
                              'assets/page-1/images/line-3-Ni5.png',
                              width: 9 * fem,
                              height: 5 * fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  // autogroupodrsydj (UBVwxPB7b2r6FRdqEFoDRs)
                  margin: EdgeInsets.fromLTRB(
                      32 * fem, 0 * fem, 33 * fem, 27 * fem),
                  width: double.infinity,
                  height: 211 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // rectangle14tVo (87:318)
                        left: 0 * fem,
                        top: 22 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 293 * fem,
                            height: 189 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
                                color: Color(0xffffecec),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // subtractaNd (87:322)
                        left: 92 * fem,
                        top: 22 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 108 * fem,
                            height: 59 * fem,
                            child: Image.asset(
                              'assets/page-1/images/subtract-EWD.png',
                              width: 108 * fem,
                              height: 59 * fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // ellipse135aH (87:321)
                        left: 109 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 70 * fem,
                            height: 70 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35 * fem),
                                border: Border.all(color: Color(0xffececec)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/page-1/images/ellipse-13-bg.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle15MGu (87:325)
                        left: 25 * fem,
                        top: 105 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 245 * fem,
                            height: 33 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12 * fem),
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // usermailid4BK (87:328)
                        left: 50 * fem,
                        top: 112 * fem,
                        child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 200 * fem,
                            height: 19 * fem,
                            child: Text(
                              user!.email.toString()
                              //'User Mail ID',
                              ,
                              textAlign: TextAlign.center,
                              /* style: SafeGoogleFont (
                                'ABeeZee',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.1825*ffem/fem,
                                color: Color(0xffd9d9d9),
                              ),*/
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // vector9Cm (87:326)
                        left: 37 * fem,
                        top: 112 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 24 * fem,
                            height: 19 * fem,
                            child: Image.asset(
                              'assets/page-1/images/vector.png',
                              width: 24 * fem,
                              height: 19 * fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // vectorTjF (87:330)
                        left: 86 * fem,
                        top: 167 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 19.16 * fem,
                            height: 19 * fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-kKB.png',
                              width: 19.16 * fem,
                              height: 19 * fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // signoutmzq (87:331)
                        left: 114 * fem,
                        top: 167 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 65 * fem,
                            height: 19 * fem,
                            child: Text(
                              'Sign Out',
                              textAlign: TextAlign.center,
                              /*  style: SafeGoogleFont (
                                'ABeeZee',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.1825*ffem/fem,
                                color: Color(0xff363636),
                              ),*/
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroupcfymSr5 (UBVxCTbzYapTXCPUFDCfYm)
                  margin:
                      EdgeInsets.fromLTRB(41 * fem, 0 * fem, 47 * fem, 0 * fem),
                  width: double.infinity,
                  height: 110 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRect(
                        // autogroupmndpxpR (UBVxKnj7WxxXjXaBV6MndP)
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10 * fem,
                            sigmaY: 10 * fem,
                          ),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 50 * fem, 0 * fem),
                            padding: EdgeInsets.fromLTRB(27.38 * fem,
                                33.62 * fem, 26.38 * fem, 26.38 * fem),
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(20 * fem),
                            ),
                            child: Center(
                              // tablerpasswordfingerprintEG9 (87:336)
                              child: SizedBox(
                                width: 56.25 * fem,
                                height: 50 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/tabler-password-fingerprint.png',
                                  width: 56.25 * fem,
                                  height: 50 * fem,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // autogroupwmahwwF (UBVxPTHg1A2ZqhAY72wMAh)
                        padding: EdgeInsets.fromLTRB(
                            33.63 * fem, 24.25 * fem, 32.63 * fem, 23.25 * fem),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(20 * fem),
                        ),
                        child: Center(
                          // solarpostscarouselverticalline (87:347)
                          child: SizedBox(
                            width: 40.75 * fem,
                            height: 62.5 * fem,
                            child: Image.asset(
                              'assets/page-1/images/solar-posts-carousel-vertical-linear.png',
                              width: 43.75 * fem,
                              height: 62.5 * fem,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogrouputrxmfP (UBVxVCd6apUfnBPYoaUtRX)
                  margin: EdgeInsets.fromLTRB(
                      65.5 * fem, 0 * fem, 60.5 * fem, 31 * fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // securityVLV (87:375)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 100 * fem, 0 * fem),
                        child: Text(
                          'Security',
                          textAlign: TextAlign.center,
                          /* style: SafeGoogleFont (
                            'Actor',
                            fontSize: 18*ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2025*ffem/fem,
                            color: Color(0xff000000),
                          ),*/
                        ),
                      ),
                      Text(
                        // mypostso6H (87:376)
                        'My Posts',
                        textAlign: TextAlign.center,
                        /*   style: SafeGoogleFont (
                          'Actor',
                          fontSize: 18*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2025*ffem/fem,
                          color: Color(0xff000000),
                        ),*/
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroupcqem8PT (UBVxccaQqfERavX5y1CQem)
                  margin: EdgeInsets.fromLTRB(
                      41 * fem, 0 * fem, 43 * fem, 20 * fem),
                  width: double.infinity,
                  height: 147 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // rectangle20S9F (87:335)
                        left: 164 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 90 * fem,
                            height: 110 * fem,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20 * fem),
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle19KD3 (87:334)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 100 * fem,
                            height: 110 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // groupEL1 (92:395)
                        left: 25 * fem,
                        top: 25 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 50 * fem,
                            height: 60 * fem,
                            child: Image.asset(
                              'assets/page-1/images/group-chX.png',
                              width: 60 * fem,
                              height: 60 * fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // groupjGm (93:66)
                        left: 189 * fem,
                        top: 25 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 60 * fem,
                            height: 60 * fem,
                            child: Image.asset(
                              'assets/page-1/images/group.png',
                              width: 60 * fem,
                              height: 60 * fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // apppermissions1k5 (87:377)
                        left: 10 * fem,
                        top: 103 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 91 * fem,
                            height: 44 * fem,
                            child: Text(
                              'App Permissions',
                              textAlign: TextAlign.center,
                              /*   style: SafeGoogleFont (
                                'Actor',
                                fontSize: 18*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2025*ffem/fem,
                                color: Color(0xff000000),
                              ),*/
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // supportVQM (87:378)
                        left: 188.5 * fem,
                        top: 109 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 60 * fem,
                            height: 22 * fem,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Scenee()));
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                'Support',
                                textAlign: TextAlign.center,
                                /*style: SafeGoogleFont (
                                  'Actor',
                                  fontSize: 18*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2025*ffem/fem,
                                  color: Color(0xff000000),
                                ),*/
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // madeinindiaMhT (87:380)
                        left: 80 * fem,
                        top: 123 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 103 * fem,
                            height: 19 * fem,
                            child: Text(
                              '\n\n\n\n\n\n\n\n\n\n\n\n\n\nMade in India\n',
                              textAlign: TextAlign.center,
                              /* style: SafeGoogleFont (
                                'ABeeZee',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.1825*ffem/fem,
                                color: Color(0xff000000),
                              ),*/
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
