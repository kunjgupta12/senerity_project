import 'package:flutter/material.dart';
import 'package:untitled5/nav_bar.dart';

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profilepage()));
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
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              //Text("Terms & Conditions"),
              Text(
                "Understanding Our Terms and Conditions",
                style: TextStyle(fontSize: .060 * h),
              ),
              Text(
                  "At SPK Welfare Foundation, we’re committed to providing you with a safe and supportive environment through our app. To ensure clarity, fairness, and legal protection for both you and us, we have a set of “Terms and Conditions.”"),
              Text(
                "What are Terms and Conditions?",
                style: TextStyle(fontSize: .060 * h),
              ),
              Text(
                  "“Terms and Conditions” are a set of rules and guidelines that outline how our app works, what’s expected of you as a user, and what you can expect from us. They cover everything from how to use our features to your rights and responsibilities."),
              Text(
                "Why Should You Read Them?",
                style: TextStyle(fontSize: .060 * h),
              ),
              Text(
                  " Reading our Terms and Conditions is essential because they lay out the rules of engagement. By understanding these terms, you’ll know what to expect, how to use our app, and how we handle your data. It’s about transparency and building trust between us and our community."),
              Text("What’s Included? Our Terms and Conditions cover:"),
              Text(
                  "The services we offer Payment and refund policies               How we handle your privacy and data              Who owns our content and what you can and can’t do with itHow disputes are resolvedYour responsibilities as a user"),
              Text(
                  'How to Access Them? You can find the complete Terms and Conditions in PDF format here page. It’s important to read through them before you start using our app.'),
              Text(
                  'Your Agreement Matters When you use our app, you’re agreeing to follow these rules. It’s like a mutual understanding that helps us maintain a positive community for everyone.'),
              Text(
                  'If you have any questions or concerns about our Terms and Conditions, don’t hesitate to reach out to us. We’re here to ensure you have a safe and enjoyable experience.          Thank you for being part of our SPK Welfare Foundation community!')
            ],
          ),
        ),
      ),
    );
  }
}
