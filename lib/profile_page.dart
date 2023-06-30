import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final ref=FirebaseDatabase.instance.ref('user');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: StreamBuilder(
       //   stream: ref.child(SessionController().userId.toString()).onValue,
          builder: (context,AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return Center(child: CircularProgressIndicator());
            }
            else if(snapshot.hasData)
              {
                return  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            SizedBox(
            height: 20,
            ),
            Center(
            child: Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
            width: 5,
            )
            ),
            child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image(
            fit:BoxFit.cover,
            image: NetworkImage(""),
            loadingBuilder: (context,child,loadingprocess){
            if(loadingprocess==null) return child;
            return CircularProgressIndicator();
            },
            errorBuilder:(context,object,stack){
            return  Container(
            child: Icon(Icons.error_outline,color: Colors.blue,),
            );
            }
            )
            ),

            ),
            )
            ],
            );
              }
            else
              {
                return Center(child: CircularProgressIndicator());
              }
          },
        ),
      ),

    );
  }
}
