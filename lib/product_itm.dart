import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:untitled5/doctor_details.dart';

class ProductItem extends StatefulWidget {
  String productName;
  String productPrice;

  ProductItem({
    required this.productName,
    required this.productPrice,
  });

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
      double displayWidth = MediaQuery.of(context).size.width;
    double displayheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),

          border: Border.all(color: Colors.black38),
            boxShadow: [
            BoxShadow(
            blurRadius: 10,
            spreadRadius: 7,
            offset: Offset(1, 1),
            color: Colors.grey.withOpacity(.2))]
        ),
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
                          widget.productName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                              fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 160),
                        child: Text("Rs. ${widget.productPrice}",
                            style:
                                TextStyle(color: Colors.black38, fontSize: 20)),
                      )

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
                                  productName:widget.productName ,
                                  productPrice:
                                  widget.productPrice)));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
