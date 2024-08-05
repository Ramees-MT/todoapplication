import 'package:flutter/material.dart';
import 'package:todoapplication/util/constants.dart';

class Settings extends StatelessWidget {
  const Settings(
      {super.key,
      required this.icon,
      required this.iconButton,
      required this.text});
  final IconData icon;
  final IconButton iconButton;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          text,
          style: TextStyle(color: ktextdColor, fontSize: 18),
        ),
        Spacer(),
        IconButton(
          onPressed: null,
          icon: iconButton,
          color: Colors.white,
        ),
      ],
    );
  }
}
