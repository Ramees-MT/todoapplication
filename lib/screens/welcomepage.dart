import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapplication/screens/loginpage.dart';
// ignore: unused_import
import 'package:todoapplication/screens/organisepage.dart';
import 'package:todoapplication/screens/registerscreen.dart';
import 'package:todoapplication/util/constants.dart';
import 'package:todoapplication/widgets/fwsmallbuttonwidget.dart';
import 'package:todoapplication/widgets/logintfwidget.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back when icon is pressed
          },
          color: Colors.white,
        ),
        backgroundColor: kbackgroundColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              'Welcome to UpTodo',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 33),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Please login to your account or create',
            style: TextStyle(color: Colors.white.withOpacity(0.5)),
          ),
          Text(
            'new account to continue',
            style: TextStyle(color: Colors.white.withOpacity(0.5)),
          ),
          Spacer(),
          SmallButton(
            name: 'LOGIN',
            onpress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
              );
            },
          ),
          Logintfwidget(
            name: 'CREATE ACCOUNT',
            onpress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Register(),
                ),
              );
            },
            imagepath: '',
          )
        ],
      ),
    );
  }
}
