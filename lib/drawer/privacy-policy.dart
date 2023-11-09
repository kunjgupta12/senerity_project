import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled5/utils.dart';

class privacy_policy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // privacypolicynvD (17:95)
        width: double.infinity,
        height: 800 * fem,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(26 * fem),
        ),
        child: Stack(
          children: [
            Positioned(
              // frame7tiM (262:209)
              left: 0 * fem,
              top: 0 * fem,
              child: Container(
                width: 1412 * fem,
                height: 864 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // rectangle23BxM (262:208)
                      margin: EdgeInsets.fromLTRB(
                          526.5 * fem, 0 * fem, 525.5 * fem, 7 * fem),
                      width: double.infinity,
                      height: 67 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff000000)),
                        color: Color(0xffffffff),
                      ),
                    ),
                    Container(
                      // group2trm (262:179)
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // autogroupkechQq7 (UBW2SWCgp8AzCkkFJXKecH)
                            margin: EdgeInsets.fromLTRB(
                                566 * fem, 0 * fem, 566 * fem, 5 * fem),
                            width: double.infinity,
                            height: 148 * fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  // atspkwelfarefoundationwevaluey (262:170)
                                  left: 0 * fem,
                                  top: 55 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 280 * fem,
                                      height: 93 * fem,
                                      child: Text(
                                        'At SPK Welfare Foundation, we value your privacy and are committed to safeguarding your personal information. Our Privacy Policy explains how we collect, use, share, and protect your data when you use our app and services.\n',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'ABeeZee',
                                          fontSize: 13 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.1825 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // overviewofourprivacypolicy4oB (262:169)
                                  left: 15.5 * fem,
                                  top: 0 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 248 * fem,
                                      height: 74 * fem,
                                      child: Text(
                                        'Overview of Our Privacy Policy\n\n',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Montserrat',
                                          fontSize: 20 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2175 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // whatourprivacypolicycoversWv5 (262:171)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 1 * fem, 7 * fem),
                            constraints: BoxConstraints(
                              maxWidth: 250 * fem,
                            ),
                            child: Text(
                              'What Our Privacy Policy Covers:',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Montserrat',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2175 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // informationcollectionlearnwhat (262:172)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 20 * fem),
                            constraints: BoxConstraints(
                              maxWidth: 280 * fem,
                            ),
                            child: Text(
                              'Information Collection: Learn what types of data we collect, including personal information and usage details.\nHow We Use Your Data: Discover how we use your information to provide services, communicate with you, and enhance our offerings.\nData Security: Find out about the security measures we take to protect your personal information.\nYour Choices: Understand how you can update your personal information and make choices about your data.\nChildren’s Privacy: Learn that our services are not intended for children under 13, and how we handle their data.\n',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'ABeeZee',
                                fontSize: 13 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.1825 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // whyyoushouldreaditQXb (262:173)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 1 * fem, 31 * fem),
                            constraints: BoxConstraints(
                              maxWidth: 249 * fem,
                            ),
                            child: Text(
                              'Why You Should Read It:',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Montserrat',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2175 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // ourprivacypolicyisdesignedtopr (262:174)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 8 * fem),
                            constraints: BoxConstraints(
                              maxWidth: 279 * fem,
                            ),
                            child: Text(
                              'Our Privacy Policy is designed to provide transparency about how we handle your information. By understanding our practices, you can make informed decisions about using our app.\n',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'ABeeZee',
                                fontSize: 13 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.1825 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // howtoaccessthefullpolicyWDF (262:175)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 1 * fem, 7 * fem),
                            constraints: BoxConstraints(
                              maxWidth: 239 * fem,
                            ),
                            child: Text(
                              'How to Access the Full Policy:',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Montserrat',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2175 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // formoredetailedinformationplea (262:176)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 10 * fem),
                            constraints: BoxConstraints(
                              maxWidth: 266 * fem,
                            ),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: SafeGoogleFont(
                                  'ABeeZee',
                                  fontSize: 13 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.1825 * ffem / fem,
                                  color: Color(0xff000000),
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'For more detailed information, please read our complete Privacy Policy ',
                                  ),
                                  TextSpan(
                                    text: 'linked',
                                    style: SafeGoogleFont(
                                      'ABeeZee',
                                      fontSize: 13 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.1825 * ffem / fem,
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff000000),
                                      decorationColor: Color(0xff000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' here',
                                    style: SafeGoogleFont(
                                      'ABeeZee',
                                      fontSize: 13 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.1825 * ffem / fem,
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff000000),
                                      decorationColor: Color(0xff000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '. It’s important to be informed about your data rights and how we protect your privacy.\n',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // yourconsentmattersrrm (262:177)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 1 * fem, 5 * fem),
                            child: Text(
                              'Your Consent Matters:',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Montserrat',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2175 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Text(
                            // byusingourappyouagreetotheprac (262:178)
                            'By using our app, you agree to the practices outlined in our Privacy Policy. Your trust is important to us, and we’re here to answer any questions you may have.\n\nThank you for being a part of our SPK Welfare Foundation community!\n',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'ABeeZee',
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1825 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // frame1bC5 (129:386)
              left: 112 * fem,
              top: 24.5 * fem,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: 146 * fem,
                  height: 41 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // frame1qs7 (129:387)
                        width: 137 * fem,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                        ),
                        child: Center(
                          child: Text(
                            'Privacy Policy',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Josefin Sans',
                              fontSize: 19 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // line3uMB (129:389)
                        width: 9 * fem,
                        height: 5 * fem,
                        child: Image.asset(
                          'assets/page-1/images/line-3.png',
                          width: 9 * fem,
                          height: 5 * fem,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              // statusbarandroidR4d (262:181)
              left: 0 * fem,
              top: 0 * fem,
              child: Container(
                padding:
                    EdgeInsets.fromLTRB(16 * fem, 4 * fem, 16 * fem, 4 * fem),
                width: 360 * fem,
                height: 24 * fem,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // androidtime59B (I262:181;162:474)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 1 * fem, 189 * fem, 0 * fem),
                      width: 52 * fem,
                      height: 15 * fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // clockn3b (I262:181;162:474;162:289)
                            left: 0 * fem,
                            top: 0 * fem,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 17 * fem, 0 * fem),
                              width: 48 * fem,
                              height: 15 * fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    // hoursqnZ (I262:181;162:474;162:290)
                                    '09',
                                    style: SafeGoogleFont(
                                      'Roboto',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.1725 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  Text(
                                    // ZiZ (I262:181;162:474;162:291)
                                    ':',
                                    style: SafeGoogleFont(
                                      'Roboto',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.1725 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                  Text(
                                    // minutesW81 (I262:181;162:474;162:292)
                                    '30',
                                    style: SafeGoogleFont(
                                      'Roboto',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.1725 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            // pmQz5 (I262:181;162:474;162:295)
                            left: 33 * fem,
                            top: 0 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 19 * fem,
                                height: 15 * fem,
                                child: Text(
                                  'PM',
                                  style: SafeGoogleFont(
                                    'Roboto',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.1725 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // iconsgRo (I262:181;162:475)
                      height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // autogroup9iemp2D (UBW2zEnovxa5G3u42q9iEm)
                            width: 42.5 * fem,
                            height: 16 * fem,
                            child: Image.asset(
                              'assets/page-1/images/auto-group-9iem.png',
                              width: 42.5 * fem,
                              height: 16 * fem,
                            ),
                          ),
                          Container(
                            // androidcellularsignalidP (I262:181;162:478)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 8 * fem, 0 * fem),
                            width: 18 * fem,
                            height: double.infinity,
                            child: Stack(
                              children: [
                                Positioned(
                                  // gELq (I262:181;162:478;162:411)
                                  left: 0 * fem,
                                  top: 0 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 8 * fem,
                                      height: 8 * fem,
                                      child: Text(
                                        '5G',
                                        style: SafeGoogleFont(
                                          'Roboto',
                                          fontSize: 6 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.1725 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // barsiWu (I262:181;162:478;162:412)
                                  left: 0 * fem,
                                  top: 0 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 18 * fem,
                                      height: 16 * fem,
                                      child: Image.asset(
                                        'assets/page-1/images/bars.png',
                                        width: 18 * fem,
                                        height: 16 * fem,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // androidbatteryCBB (I262:181;162:479)
                            width: 18.5 * fem,
                            height: 11 * fem,
                            child: Image.asset(
                              'assets/page-1/images/android-battery-tbK.png',
                              width: 18.5 * fem,
                              height: 11 * fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // component1uLV (44:255)
              left: 0 * fem,
              top: 724 * fem,
              child: Container(
                padding:
                    EdgeInsets.fromLTRB(34 * fem, 13 * fem, 33 * fem, 13 * fem),
                width: 360 * fem,
                height: 76 * fem,
                decoration: BoxDecoration(
                  color: Color(0xffffecec),
                  borderRadius: BorderRadius.circular(18 * fem),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // communityYuF (I44:255;44:246)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 35 * fem, 0 * fem),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              18 * fem, 8 * fem, 18 * fem, 7.92 * fem),
                          height: double.infinity,
                          child: Center(
                            // communitylines1RCM (I44:255;44:249)
                            child: SizedBox(
                              width: 42 * fem,
                              height: 34.08 * fem,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Image.asset(
                                  'assets/page-1/images/community-lines-1-34m.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogrouphywpWjb (UBW3CQ7DMxPjtKugpGhywP)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 24 * fem, 0 * fem),
                      padding: EdgeInsets.fromLTRB(
                          16 * fem, 8 * fem, 27.92 * fem, 7.92 * fem),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/page-1/images/snaphelp.png',
                          ),
                        ),
                      ),
                      child: Center(
                        // snaphelp1oCu (I44:255;44:250)
                        child: SizedBox(
                          width: 34.08 * fem,
                          height: 34.08 * fem,
                          child: Image.asset(
                            'assets/page-1/images/snaphelp-1-jtD.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupdvrd7UV (UBW3HPxtPVJhV6dGCvDvrd)
                      padding: EdgeInsets.fromLTRB(
                          21 * fem, 8 * fem, 22.92 * fem, 7.92 * fem),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/page-1/images/medimeet-JiV.png',
                          ),
                        ),
                      ),
                      child: Center(
                        // medimeet1RVB (I44:255;44:251)
                        child: SizedBox(
                          width: 34.08 * fem,
                          height: 34.08 * fem,
                          child: Image.asset(
                            'assets/page-1/images/medimeet-1-6Eu.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
