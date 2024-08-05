import 'package:flutter/material.dart';
import 'package:todoapplication/screens/indexscreen.dart';
import 'package:todoapplication/screens/loginpage.dart';
import 'package:todoapplication/screens/organisepage.dart';
import 'package:todoapplication/util/constants.dart';
import 'package:todoapplication/widgets/fwsmallbuttonwidget.dart';
import 'package:todoapplication/widgets/logintfwidget.dart';
import 'package:todoapplication/widgets/textfieldwidget.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back when icon is pressed
          },
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 15,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 33),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Username',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Textfieldwidget(
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                hinttext: 'Enter your user name',
                obscuretext: false,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                '   Password',
                style: TextStyle(color: Colors.white),
              ),
              Textfieldwidget(
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                hinttext: 'Enter your password',
                obscuretext: true,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                '   Confirm Password',
                style: TextStyle(color: Colors.white),
              ),
              Textfieldwidget(
                controller: _confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                hinttext: 'Enter your password again',
                obscuretext: true,
              ),
              SizedBox(
                height: 40,
              ),
              SmallButton(
                name: 'Register',
                onpress: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Index(),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'or',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Logintfwidget(
                name: 'Login with Google',
                onpress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Organise(),
                    ),
                  );
                },
                imagepath: 'asset/images/google-removebg-preview.png',
              ),
              SizedBox(
                height: 10,
              ),
              Logintfwidget(
                imagepath: 'asset/images/apple-removebg-preview.png',
                name: 'Login with apple',
                onpress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Organise(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                    TextButton(
                      child: Text(
                        " Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => Login()),
                            ));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
