import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled5/utils.dart';

class Scenee extends StatelessWidget {
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
            // supporttmo (17:89)
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(26 * fem),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // autogrouphvx7otm (UBVzkPMWXZSqGRCuoZHVX7)
                  padding: EdgeInsets.fromLTRB(
                      23.5 * fem, 33 * fem, 23.5 * fem, 197.25 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // frame1t9X (129:374)
                        margin: EdgeInsets.fromLTRB(
                            100.5 * fem, 0 * fem, 99.5 * fem, 35 * fem),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                7.5 * fem, 0 * fem, 7.5 * fem, 0 * fem),
                            width: double.infinity,
                            height: 41 * fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // frame1vM7 (129:375)
                                  width: 89 * fem,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Support',
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
                                  // line3NU1 (129:377)
                                  width: 9 * fem,
                                  height: 5 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/line-3-aKB.png',
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
                        // autogrouprfw9gzV (UBVypaZqD81qyiZ9S4RfW9)
                        margin: EdgeInsets.fromLTRB(
                            2.5 * fem, 0 * fem, 0 * fem, 24 * fem),
                        width: 219 * fem,
                        height: 91 * fem,
                        child: Stack(
                          children: [
                            Positioned(
                              // gotaqueryb5s (278:227)
                              left: 0 * fem,
                              top: 0 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 185 * fem,
                                  height: 41 * fem,
                                  child: Text(
                                    'Got a query?',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Racing Sans One',
                                      fontSize: 32 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.26 * ffem / fem,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // wegotchuFRK (278:230)
                              left: 0 * fem,
                              top: 40 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 219 * fem,
                                  height: 51 * fem,
                                  child: Text(
                                    'We Gotch’u!',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Racing Sans One',
                                      fontSize: 40 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.26 * ffem / fem,
                                      color: Color(0xff75cd73),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // visitourwebsitegWd (278:231)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 13 * fem),
                        width: double.infinity,
                        child: Text(
                          'Visit Our website',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Roboto',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.1725 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // autogrouplm3pmny (UBVyzQcnhGcPzS6eNGLm3P)
                        margin: EdgeInsets.fromLTRB(
                            2.5 * fem, 0 * fem, 142.5 * fem, 23 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // dashiconsadminsiteUxH (278:233)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 5 * fem, 0 * fem),
                              width: 18 * fem,
                              height: 18 * fem,
                              child: Image.asset(
                                'assets/page-1/images/dashicons-admin-site.png',
                                width: 18 * fem,
                                height: 18 * fem,
                              ),
                            ),
                            Text(
                              // wwwsochpekharochinNGy (278:232)
                              'www.sochpekharoch.in',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Roboto',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.1725 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // connectwithusonsocialmediatFK (278:235)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 12 * fem),
                        width: double.infinity,
                        child: Text(
                          'Connect with us on Social media',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Roboto',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.1725 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // autogroupp5pm8vM (UBVz7a5X6jX71wPhm4P5pm)
                        margin: EdgeInsets.fromLTRB(
                            2.5 * fem, 0 * fem, 219.5 * fem, 12 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // mdilinkedinqpm (278:240)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 20 * fem, 0 * fem),
                              width: 18 * fem,
                              height: 18 * fem,
                              child: Image.asset(
                                'assets/page-1/images/mdi-linkedin.png',
                                width: 18 * fem,
                                height: 18 * fem,
                              ),
                            ),
                            Text(
                              // linkedinXhb (278:236)
                              'LinkedIn',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Roboto',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.1725 * ffem / fem,
                                decoration: TextDecoration.underline,
                                color: Color(0xff000000),
                                decorationColor: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupwczo3fw (UBVzE9itWz82tZ4yh3WcZo)
                        margin: EdgeInsets.fromLTRB(
                            2.5 * fem, 0 * fem, 151.5 * fem, 10.5 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // fa6brandssquarextwitterMAq (278:242)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 20 * fem, 0 * fem),
                              width: 19 * fem,
                              height: 22 * fem,
                              child: Image.asset(
                                'assets/page-1/images/fa6-brands-square-x-twitter.png',
                                width: 19 * fem,
                                height: 22 * fem,
                              ),
                            ),
                            Container(
                              // xformerlytwitterSi5 (278:237)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 1 * fem, 0 * fem, 0 * fem),
                              child: Text(
                                'X(Formerly Twitter)',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Roboto',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.1725 * ffem / fem,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff000000),
                                  decorationColor: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupax7sivV (UBVzL4ihfZoW1sBeEgAx7s)
                        margin: EdgeInsets.fromLTRB(
                            2 * fem, 0 * fem, 207.5 * fem, 9.5 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // formkitinstagrame3T (278:244)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 18.5 * fem, 0 * fem),
                              width: 21 * fem,
                              height: 21 * fem,
                              child: Image.asset(
                                'assets/page-1/images/formkit-instagram.png',
                                width: 21 * fem,
                                height: 21 * fem,
                              ),
                            ),
                            Container(
                              // instagramj4u (278:238)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 1 * fem),
                              child: Text(
                                'Instagram',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Roboto',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.1725 * ffem / fem,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff000000),
                                  decorationColor: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupbgzfDVs (UBVzSUhgWuB4heyGKaBgZf)
                        margin: EdgeInsets.fromLTRB(
                            2.5 * fem, 0 * fem, 220.5 * fem, 27 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // bithreadsfillvfB (278:246)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 18 * fem, 0 * fem),
                              width: 21 * fem,
                              height: 22 * fem,
                              child: Image.asset(
                                'assets/page-1/images/bi-threads-fill.png',
                                width: 21 * fem,
                                height: 22 * fem,
                              ),
                            ),
                            Container(
                              // threadscnu (278:239)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 1 * fem),
                              child: Text(
                                'Threads',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Roboto',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.1725 * ffem / fem,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff000000),
                                  decorationColor: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // letschatonwhatsappJ9w (278:250)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 15.25 * fem),
                        width: double.infinity,
                        child: Text(
                          'Let’s Chat on WhatsApp!',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Roboto',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.1725 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // autogroupcrxfa7T (UBVzY4NiXePoTKJdB2cRXF)
                        margin: EdgeInsets.fromLTRB(
                            1.83 * fem, 0 * fem, 213.5 * fem, 0 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // uimwhatsappgwB (286:194)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 9.33 * fem, 0 * fem),
                              width: 23.33 * fem,
                              height: 22.5 * fem,
                              child: Image.asset(
                                'assets/page-1/images/uim-whatsapp.png',
                                width: 23.33 * fem,
                                height: 22.5 * fem,
                              ),
                            ),
                            Container(
                              // whatsappNp1 (286:193)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 2 * fem),
                              child: Text(
                                'WhatsApp',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Roboto',
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.1725 * ffem / fem,
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff000000),
                                  decorationColor: Color(0xff000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // component1U6M (44:254)
                  padding: EdgeInsets.fromLTRB(
                      34 * fem, 13 * fem, 33 * fem, 13 * fem),
                  width: double.infinity,
                  height: 76 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffffecec),
                    borderRadius: BorderRadius.circular(18 * fem),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // autogroupxsahAE5 (UBW1SXsHJjysFQqAmpXsAH)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 35 * fem, 0 * fem),
                        padding: EdgeInsets.fromLTRB(
                            18 * fem, 8 * fem, 18 * fem, 7.92 * fem),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/page-1/images/community.png',
                            ),
                          ),
                        ),
                        child: Center(
                          // communitylines1r6u (I44:254;44:249)
                          child: SizedBox(
                            width: 42 * fem,
                            height: 34.08 * fem,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Image.asset(
                                'assets/page-1/images/community-lines-1-abj.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // autogroupqcyfwPF (UBW1Y2i832avQfDhhjQCyF)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 24 * fem, 0 * fem),
                        padding: EdgeInsets.fromLTRB(
                            16 * fem, 8 * fem, 27.92 * fem, 7.92 * fem),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/page-1/images/snaphelp-Bk5.png',
                            ),
                          ),
                        ),
                        child: Center(
                          // snaphelp1dWy (I44:254;44:250)
                          child: SizedBox(
                            width: 34.08 * fem,
                            height: 34.08 * fem,
                            child: Image.asset(
                              'assets/page-1/images/snaphelp-1-Ea5.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // autogrouprydkA17 (UBW1bXcHxJRbKzvQUaryDK)
                        padding: EdgeInsets.fromLTRB(
                            21 * fem, 8 * fem, 22.92 * fem, 7.92 * fem),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/page-1/images/medimeet-ysf.png',
                            ),
                          ),
                        ),
                        child: Center(
                          // medimeet1sRK (I44:254;44:251)
                          child: SizedBox(
                            width: 34.08 * fem,
                            height: 34.08 * fem,
                            child: Image.asset(
                              'assets/page-1/images/medimeet-1-oS9.png',
                              fit: BoxFit.cover,
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
