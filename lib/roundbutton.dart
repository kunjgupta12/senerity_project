import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({Key? key, required this.title, required this.onPress})
      : super(key: key);

  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.black
            //  image: DecorationImage(
            //     image: AssetImage("img/img.png"), fit: BoxFit.fill)
            ),
        child: MaterialButton(
          // shape: ShapeBorder.lerp(w, h, t),
          color: Colors.black,
          height: 50,
          minWidth: double.infinity,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'JosefinSans',
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: onPress,
        ),
      ),
    );
  }
}
