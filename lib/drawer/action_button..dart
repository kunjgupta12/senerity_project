import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({Key? key, this.onPressed, required this.icon})
      : super(key: key);

  final VoidCallback? onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: Colors.black,
      elevation: 4.0,
      child: IconButton(
        iconSize: 40,
        color: Colors.black,
        onPressed: onPressed,
        icon: Image.asset(icon),
      ),
    );
  }
}
