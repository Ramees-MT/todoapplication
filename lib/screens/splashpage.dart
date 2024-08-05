import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:todoapplication/util/constants.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'asset/images/removed tick.png',
              height: 120,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'UpTodo',
            style: TextStyle(
                color: ktextdColor, fontWeight: FontWeight.bold, fontSize: 30),
          )
        ],
      ),
    );
  }
}
