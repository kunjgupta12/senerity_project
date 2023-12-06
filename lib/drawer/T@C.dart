import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:untitled5/bottom_nav/nav_bar.dart';

class terms_condition extends StatefulWidget {
  const terms_condition({super.key});

  @override
  State<terms_condition> createState() => _terms_conditionState();
}

class _terms_conditionState extends State<terms_condition> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    double headingfont = w * .058;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'SourceCodepro'),
        home: Scaffold(
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    /*    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => profilepage()));*/
                  },
                );
              },
            ),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: const Text(
              'Terms and Conditions',
              style: TextStyle(
                  fontFamily: 'JosefinSans', fontSize: 25, color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: h * .02,
                        ),
                        //Text("Terms & Conditions"),

                        Text(
                          "Understanding Our Terms and Conditions",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: headingfont,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "At SPK Welfare Foundation, we’re committed to providing you with a safe and supportive environment through our app. To ensure clarity, fairness, and legal protection for both you and us, we have a set of “Terms and Conditions.”",
                          style: TextStyle(
                              fontSize: headingfont * .7,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'SourceCodepro'),
                        ),
                        SizedBox(
                          height: h * .04,
                        ),
                        RichText(
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "What are Terms and Conditions?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: headingfont,
                                      fontFamily: 'SourceCodepro')),
                              TextSpan(
                                  text:
                                      "Terms and Conditions” are a set of rules and guidelines that outline how our app works, what’s expected of you as a user, and what you can expect from us. They cover everything from how to use our features to your rights and responsibilities.",
                                  style: TextStyle(
                                      fontSize: headingfont * .7,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'SourceCodepro')),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: h * .04,
                        ),
                        RichText(
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Why Should You Read Them?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: headingfont,
                                      fontFamily: 'SourceCodepro')),
                              TextSpan(
                                  text:
                                      " Reading our Terms and Conditions is essential because they lay out the rules of engagement. By understanding these terms, you’ll know what to expect, how to use our app, and how we handle your data. It’s about transparency and building trust between us and our community.",
                                  style: TextStyle(
                                      fontSize: headingfont * .7,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'SourceCodepro')),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: h * .04,
                        ),
                        RichText(
                          textDirection: TextDirection.ltr,
                          text: TextSpan(
                            text: 'What’s Included? ',

                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: TextStyle(
                                fontSize: headingfont,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'SourceCodepro'),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Our Terms and Conditions cover: ',
                                  style: TextStyle(
                                      fontSize: headingfont * .7,
                                      fontFamily: 'SourceCodepro')),
                            ],
                          ),
                        ),

                        RichText(
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "\u2022",
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontFamily: 'SourceCodepro'),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SourceCodepro')),
                              TextSpan(
                                text: ' The services we offer',
                                style: TextStyle(
                                    fontSize: headingfont * .7,
                                    fontFamily: 'SourceCodepro'),
                              )
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontFamily: 'SourceCodepro'),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "\u2022",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SourceCodepro')),
                              TextSpan(
                                  text: 'Payment and refund policies',
                                  style: TextStyle(
                                      fontSize: headingfont * .7,
                                      fontFamily: 'SourceCodepro')),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontFamily: 'SourceCodepro'),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "\u2022",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SourceCodepro')),
                              TextSpan(
                                  text: 'How we handle your privacy and data',
                                  style: TextStyle(
                                      fontSize: headingfont * .7,
                                      fontFamily: 'SourceCodepro')),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontFamily: 'SourceCodepro'),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "\u2022",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SourceCodepro')),
                              TextSpan(
                                  text:
                                      'Who owns our content and what you can and can’t do with it',
                                  style: TextStyle(
                                      fontSize: headingfont * .7,
                                      fontFamily: 'SourceCodepro')),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontFamily: 'SourceCodepro'),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "\u2022",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SourceCodepro')),
                              TextSpan(
                                  text: 'How disputes are resolved',
                                  style: TextStyle(
                                      fontSize: headingfont * .7,
                                      fontFamily: 'SourceCodepro')),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontFamily: 'SourceCodepro'),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "\u2022",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SourceCodepro')),
                              TextSpan(
                                  text: 'Your responsibilities as a user ',
                                  style: TextStyle(
                                      fontSize: headingfont * .7,
                                      fontFamily: 'SourceCodepro')),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: h * .04,
                        ),
                        RichText(
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontFamily: 'SourceCodepro'),
                            children: [
                              TextSpan(
                                  text: 'How to Access Them? ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: headingfont,
                                      fontFamily: 'SourceCodepro')),
                              TextSpan(
                                  text:
                                      'You can find the complete Terms and Conditions in PDF format',
                                  style: TextStyle(
                                      fontSize: headingfont * .7,
                                      fontFamily: 'SourceCodepro')),
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      final url = Uri.parse(
                                        'https://drive.google.com/file/d/1zIdcAxqqA-jeNgodhEHcRtSNXnMEUIAl/view?usp=sharing',
                                      );
                                      if (await canLaunchUrl(url)) {
                                        launchUrl(url,
                                            mode: LaunchMode.inAppWebView);
                                      } else {
                                        // ignore: avoid_print
                                        print("Can't open  $url");
                                      }
                                    },
                                  text: ' here',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: headingfont * .7,
                                      fontFamily: 'SourceCodepro',
                                      textBaseline: TextBaseline.alphabetic,
                                      decoration: TextDecoration.underline)),
                              TextSpan(
                                  text:
                                      ' page. It’s important to read through them before you start using our app.',
                                  style: TextStyle(
                                      fontSize: headingfont * .7,
                                      fontFamily: 'SourceCodepro'))
                            ],
                          ),
                        ),

                        SizedBox(
                          height: h * .04,
                        ),
                        RichText(
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontFamily: 'SourceCodepro'),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Your Agreement Matters ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: headingfont,
                                      fontFamily: 'SourceCodepro')),
                              TextSpan(
                                  text:
                                      'When you use our app, you’re agreeing to follow these rules. It’s like a mutual understanding that helps us maintain a positive community for everyone. ',
                                  style: TextStyle(
                                      fontSize: headingfont * .7,
                                      fontFamily: 'SourceCodepro')),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: h * .04,
                        ),
                        Text(
                            'If you have any questions or concerns about our Terms and Conditions, don’t hesitate to reach out to us. We’re here to ensure you have a safe and enjoyable experience.',
                            style: TextStyle(
                                fontSize: headingfont * .7,
                                fontFamily: 'SourceCodepro')),
                        Text(
                            'Thank you for being part of our SPK Welfare Foundation community!',
                            style: TextStyle(
                                fontSize: headingfont * .7,
                                fontFamily: 'SourceCodepro'))
                      ],
                    ),
                  ),
                ),
              )),
        ));
  }
}
