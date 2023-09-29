import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      required this.width,
      required this.title,
      required this.onPressed,
      required this.disable})
      : super(key: key);

  final double width;
  final String title;
  final bool disable; //this is used to disable button
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
        //image: DecorationImage(
        //   image: AssetImage("img/img.png"), fit: BoxFit.fill)
      ),
      width: width,
      child: MaterialButton(
        color: Colors.black,
        padding: EdgeInsets.all(2),
        onPressed: disable ? null : onPressed,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
