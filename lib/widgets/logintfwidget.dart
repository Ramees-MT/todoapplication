import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapplication/util/constants.dart';

class Logintfwidget extends StatelessWidget {
  final String name;
  final String? imagepath; // Made imagepath nullable
  final VoidCallback onpress;
  final Color? color;

  const Logintfwidget(
      {super.key,
      required this.name,
      required this.onpress,
      this.imagepath,
      this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpress,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: kbackgroundColor,
            border: Border.all(color: kButtonColor, width: 2),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imagepath != null && imagepath!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Image.asset(imagepath!),
                    height: 25,
                    decoration: BoxDecoration(
                        color: color, borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
