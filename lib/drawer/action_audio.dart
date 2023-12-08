import 'package:flutter/material.dart';

class ActionButton_Audio extends StatelessWidget {
  const ActionButton_Audio({Key? key, this.onPressed, required this.icon,required this.text})
      : super(key: key);

  final VoidCallback? onPressed;
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
   shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.all(
       Radius.circular(15),
     ),
   ),
      clipBehavior: Clip.antiAlias,
      color:const  Color.fromRGBO(49, 164, 153, 1),
      elevation: 4.0,
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [

            IconButton(

              color:const Color.fromRGBO(49, 164, 153, 1),
              onPressed: onPressed,
              icon: Image.asset(icon),
            ),
            Text(text,style: TextStyle(   fontFamily: 'SourceCodePro',
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 15,),)
          ],
        ),
      ),
    );
  }
}
