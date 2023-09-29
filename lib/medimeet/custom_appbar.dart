import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key, this.appTitle, this.route, this.icon, this.actions})
      : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60);

  final String? appTitle;
  final String? route;
  final Icon? icon;
  final List<Widget>? actions;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white, //background color is white in this app
      elevation: 0,
      title: Text(
        widget.appTitle!,
        style: TextStyle(
            fontFamily: 'JosefinSans', fontSize: 25, color: Colors.black),
      ),
      centerTitle: true,
      //if icon is not set, return null
      leading: widget.icon != null
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: IconButton(
                onPressed: () {
                  if (widget.route != null) {
                    Navigator.of(context).pushNamed(widget.route!);
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                icon: widget.icon!,
                //  iconSize: 16,
                color: Colors.black,
              ),
            )
          : null,
      //if action is not set, return null
      actions: widget.actions ?? null,
    );
  }
}
