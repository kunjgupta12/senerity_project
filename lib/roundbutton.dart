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
      child: MaterialButton(
        color: Colors.blueGrey,
        height: 50,
        minWidth: double.infinity,
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: onPress,
      ),
    );
  }
}
