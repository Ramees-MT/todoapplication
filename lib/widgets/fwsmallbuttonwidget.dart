import 'package:flutter/material.dart';

import '../util/constants.dart';

class SmallButton extends StatelessWidget {
  final String name;
  final VoidCallback? onpress;
  final Color? color;
  const SmallButton({super.key, required this.name, this.onpress, this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onpress,
        child: Container(
          decoration: BoxDecoration(
              color: color ?? kButtonColor,
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.all(12),
          child: Center(
            child: Text(
              name,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}
