import 'package:flutter/material.dart';
import 'package:todoapplication/util/constants.dart';

class Editwidget extends StatelessWidget {
  const Editwidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.time,
      this.icon2});
  final IconData icon;
  final String text;
  final String time;
  final IconData? icon2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
              color: Color(0xff363636),
              borderRadius: BorderRadius.circular(10)),
          child: TextButton(
              onPressed: null,
              child: Row(
                children: [
                  if (icon2 != null)
                    Icon(
                      icon2,
                      color: kButtonColor,
                    ),
                  if (icon2 != null)
                    SizedBox(
                      width: 10,
                    ),
                  Text(
                    time,
                    style: TextStyle(color: ktextdColor),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
