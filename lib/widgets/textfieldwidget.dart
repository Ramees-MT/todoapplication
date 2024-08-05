import 'package:flutter/material.dart';

class Textfieldwidget extends StatelessWidget {
  final String hinttext;
  final bool obscuretext;
  final Color? bgcolor;
  final TextEditingController? controller; // Make the controller optional
  final String? Function(String?)? validator; // Optional validator

  const Textfieldwidget({
    Key? key,
    required this.hinttext,
    required this.obscuretext,
    this.bgcolor = const Color(0xff363636),
    this.controller, // Optional TextEditingController
    this.validator, // Optional validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller, // Assign the optional controller here
        obscureText: obscuretext,
        validator: validator,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: bgcolor ?? const Color(0xff363636),
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.2)),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: bgcolor ?? const Color(0xff363636),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      )
    );
  }
}
