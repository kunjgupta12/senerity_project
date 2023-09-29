import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class expand extends StatefulWidget {
  const expand(
      {required this.tempTitle,
      required this.description,
      required this.img,
      super.key});
  final String tempTitle;
  final String description;
  final String img;
  @override
  State<expand> createState() => _expandState();
}

class _expandState extends State<expand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Text(widget.img),
          Center(child: Text(widget.tempTitle)),
          Image(image: NetworkImage(widget.img))
        ],
      ),
    );
  }
}
