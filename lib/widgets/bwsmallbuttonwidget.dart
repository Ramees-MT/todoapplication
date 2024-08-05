import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bwsmall extends StatelessWidget {
  final String name;
  final Color? tcolor;
  final VoidCallback? backpress;
  const Bwsmall(
      {super.key,
      required this.name,
      this.backpress,
      this.tcolor,
      required Color color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: backpress,
      child: Text(
        name,
        style: TextStyle(color: tcolor),
      ),
    );
  }
}
