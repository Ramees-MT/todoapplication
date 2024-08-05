import 'package:flutter/material.dart';
import 'package:todoapplication/util/constants.dart';

class buildSettingsRow extends StatelessWidget {
  const buildSettingsRow(
      {super.key,
      required this.icon,
      required this.textcolor,
      required this.text, required this.onpress});
  final IconData icon;
  final Color textcolor;
  final String text;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: textcolor,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(color: ktextdColor, fontSize: 18),
          ),
          Spacer(),
          IconButton(
            onPressed: onpress,
            icon: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
