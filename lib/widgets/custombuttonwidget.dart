import 'package:flutter/material.dart';

import '../util/constants.dart';

class CustomButtonWidget extends StatelessWidget {
  final String name;
  final VoidCallback onpress;

  const CustomButtonWidget({super.key, required this.name, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpress,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: kButtonColor, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
