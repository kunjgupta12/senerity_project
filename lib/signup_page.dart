import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:untitled5/auth_controller.dart';
import 'package:untitled5/welcome_page.dart';

class SignupPage extends StatelessWidget {

  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var passwordcontroller=TextEditingController();

    List images=[
      "g.png",
      "t.png",
      "f.png",
    ];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Scaffold(

      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/logo.png"), fit: BoxFit.fitHeight)),
              child: Column(
                children: [
                  SizedBox(
                    height: h * .3,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 40,
                    backgroundImage: AssetImage("img/logo.png"),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sign into your Account",
                    style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(.2))
                        ]),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: "Email id",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.deepOrangeAccent,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(.2))
                        ]),
                    child: TextField(
                      controller: passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(
                            Icons.password_outlined,
                            color: Colors.deepOrangeAccent,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            GestureDetector(
              onTap: (){
                AuthController.instance.register(emailController.text.trim(), passwordcontroller.text.trim());
              },
              child: Container(
                width: w * 0.38,
                height: h * .15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage("img/img.png"), fit: BoxFit.fill)),
                child: Center(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            RichText(text: TextSpan(
              recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
              text: 'Have an account?',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[500]
              )
            )
            ),
            SizedBox(
              height: w * 0.02,
            ),
          /*  MaterialButton(onPressed: (){
              googlesignin.signIn().then((value){
                String username=value!.displayName!;
                String profile=value.photoUrl!;
            Welcomepage(email: 'email!',);
              });
            }),*/
            RichText(

                text: TextSpan(

              text: "Sign up using one of the following methods!!!",
              style: TextStyle(color: Colors.grey[500], fontSize: 20),
            )),
            Wrap(

              children: List<Widget>.generate(3, 
                      (index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(

                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[500],
                      
                      child: CircleAvatar(

                            radius:25,
                        backgroundImage: AssetImage(
                          "img/"+images[index]
                        ),
                      ),
                    ),
                  ),
                );

                
              }),
            )
          ],
        ),
      ),
    );
  }
}
