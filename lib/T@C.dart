import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/nav_bar.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
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
          child: Container(
            alignment: AlignmentGeometry.lerp(
                Alignment.bottomLeft, AlignmentDirectional.topEnd, 2),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  //Text("Terms & Conditions"),
                  Column(
                    children: [
                      Text(
                        "Understanding Our Terms and Conditions",
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.start,
                        style: TextStyle(),
                      ),
                      Text(
                          "At SPK Welfare Foundation, we’re committed to providing you with a safe and supportive environment through our app. To ensure clarity, fairness, and legal protection for both you and us, we have a set of “Terms and Conditions.”"),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "What are Terms and Conditions?",
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "Terms and Conditions” are a set of rules and guidelines that outline how our app works, what’s expected of you as a user, and what you can expect from us. They cover everything from how to use our features to your rights and responsibilities."),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Why Should You Read Them?",
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                " Reading our Terms and Conditions is essential because they lay out the rules of engagement. By understanding these terms, you’ll know what to expect, how to use our app, and how we handle your data. It’s about transparency and building trust between us and our community."),
                      ],
                    ),
                  ),
                  RichText(
                    textDirection: TextDirection.ltr,
                    text: const TextSpan(
                      text: 'What’s Included? ',

                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Our Terms and Conditions cover: ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: "\u2022",
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: '',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' The services we offer'),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "\u2022",
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'Payment and refund policies',
                            style: TextStyle()),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "\u2022",
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'How we handle your privacy and data',
                            style: TextStyle()),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "\u2022",
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'Who owns our content and what you can and can’t do with it',
                            style: TextStyle()),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "\u2022",
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'How disputes are resolved',
                            style: TextStyle()),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "\u2022",
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'Your responsibilities as a user ',
                            style: TextStyle()),
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
                      ),
                      children: [
                        TextSpan(
                            text: 'How to Access Them? ',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'You can find the complete Terms and Conditions in PDF format'),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                final url = Uri.parse(
                                  'https://drive.google.com/file/d/1zIdcAxqqA-jeNgodhEHcRtSNXnMEUIAl/view?usp=sharing',
                                );
                                if (await canLaunchUrl(url)) {
                                  launchUrl(url, mode: LaunchMode.inAppWebView);
                                } else {
                                  // ignore: avoid_print
                                  print("Can't open  $url");
                                }
                              },
                            text: ' here',
                            style: TextStyle(color: Colors.blue)),
                        TextSpan(
                            text:
                                ' page. It’s important to read through them before you start using our app.')
                      ],
                    ),
                  ),

                  RichText(
                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Your Agreement Matters ",
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                'When you use our app, you’re agreeing to follow these rules. It’s like a mutual understanding that helps us maintain a positive community for everyone. ',
                            style: TextStyle()),
                      ],
                    ),
                  ),
                  Text(
                      'If you have any questions or concerns about our Terms and Conditions, don’t hesitate to reach out to us. We’re here to ensure you have a safe and enjoyable experience.'),
                  Text(
                      'Thank you for being part of our SPK Welfare Foundation community!')
                ],
              ),
            ),
          )),
    );
  }
}
