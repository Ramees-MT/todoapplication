import 'package:flutter/material.dart';
import 'package:todoapplication/controller/todo_controller.dart';

class Dropdownwidget extends StatelessWidget {
  Dropdownwidget({
    Key? key,
    required this.text,
    this.onChanged,
    this.icon,
  }) : super(key: key);

  final String text;
  final IconData? icon;
  final void Function(IconData?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff363636),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<IconData>(
            borderRadius: BorderRadius.circular(15),
            value: icon,
            items: categoryIcon
                .map((e) => DropdownMenuItem<IconData>(
                      child: Icon(
                        e,
                        color: Colors.blue,
                      ),
                      value: e,
                    ))
                .toList(),
            onChanged: onChanged,
            hint: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    icon ?? icon,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
