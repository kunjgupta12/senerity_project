import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:untitled5/medimeet/doctor_details.dart';

class ProductItem extends StatefulWidget {
  final String email;
  final String name;
  final String price;
  final String registraionnumber;
  final String Experience;
  final String Degree;
  final String image;
  ProductItem(
      {required this.name,
      required this.price,
      required this.registraionnumber,
      required this.email,
      required this.Experience,
      required this.Degree,
      required this.image});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayheight = MediaQuery.of(context).size.height;
    var cardImage = NetworkImage(widget.image);
    return Container(
      // padding: new EdgeInsets.all(10.0),
      child: Card(
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
        ),
        color: Colors.white,
        elevation: 1,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 35.0,
                backgroundImage: NetworkImage(widget.image),
                backgroundColor: Colors.white,
              ),

              //Image.network(cardImage.url) ,
              title: Text(widget.name, style: TextStyle(fontSize: 40.0)),
              subtitle: Text(widget.price, style: TextStyle(fontSize: 20.0)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: MaterialButton(
                  minWidth: displayWidth,
                  //    color: Colors.white,

                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorDetails(
                                  name: widget.name,
                                  Degree: widget.Degree,
                                  price: widget.price,
                                  email: widget.email,
                                  registrationnumber: widget.registraionnumber,
                                  Experience: widget.Experience,
                                  image: widget.image,
                                )));
                  },
                  child: Text(
                    'Book Video Calling Appointment:  ' + 'Rs. ' + widget.price,
                    style: TextStyle(),
                  )),
            ),
          ],
        ),
      ),
    );
    /*  return Card(

      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.blueGrey,
      child: Column(
        children: [

          ClipRRect(
            borderRadius:  BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child:
            Ink.image(
            image: cardImage,

              height: 200,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
           ListTile(
            title: Text(
              widget.name,

              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              widget.price,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DoctorDetails(
                                name: widget.name,
                                Degree: widget.Degree,
                                price: widget.price,
                                registrationnumber:
                                widget.registraionnumber,
                                Experience: widget.Experience,
                                image: widget.image,
                              )));
                      },
                      child:  Text(
                        "Book",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),

                ],
              ))
        ],
      ),
    );*/
    /*   return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.black38),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 7,
                  offset: const Offset(1, 1),
                  color: Colors.grey.withOpacity(.2))
            ]),
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          widget.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                              fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 160),
                        child: Text("Rs. ${widget.price}",
                            style:
                                TextStyle(color: Colors.black38, fontSize: 20)),
                      ),
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(widget.image),
                        backgroundColor: Colors.white,
                      ),

                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  IconButton(
                    icon: Icon(Icons.more_horiz),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DoctorDetails(
                                    name: widget.name,
                                    Degree: widget.Degree,
                                    price: widget.price,
                                    registrationnumber:
                                        widget.registraionnumber,
                                    Experience: widget.Experience,
                                image: widget.image,
                                  )));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );*/
  }
}
