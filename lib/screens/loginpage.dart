import 'package:flutter/material.dart';
import 'package:todoapplication/screens/indexscreen.dart';
import 'package:todoapplication/screens/registerscreen.dart';
import 'package:todoapplication/util/constants.dart';
import 'package:todoapplication/widgets/fwsmallbuttonwidget.dart';
import 'package:todoapplication/widgets/logintfwidget.dart';
import 'package:todoapplication/widgets/textfieldwidget.dart';
import 'package:flutter/services.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Exit the app
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: kbackgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.black,
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
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 33),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Email',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Textfieldwidget(
                  controller: _usernameController,
                  hinttext: 'Enter your email',
                  obscuretext: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Email validation regex
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Password',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Textfieldwidget(
                    controller: _passwordController,
                    hinttext: 'Enter your password',
                    obscuretext: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 8) {
                        return 'password must contain 8 charecters';
                      }
                      // Password validation: at least 8 characters, one uppercase letter, one lowercase letter, and one digit
                    }),
                SizedBox(
                  height: 40,
                ),
                SmallButton(
                  name: 'LOGIN',
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
                  height: 30,
                ),
                Logintfwidget(
                  name: 'Login with Google',
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Index(),
                      ),
                    );
                  },
                  imagepath: 'asset/images/google-removebg-preview.png',
                ),
                SizedBox(
                  height: 10,
                ),
                Logintfwidget(
                  color: Colors.white.withOpacity(0.4),
                  imagepath: 'asset/images/apple-removebg-preview.png',
                  name: 'Login with apple',
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Index(),
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
                        "Don't have an account?",
                        style: TextStyle(color: Colors.white.withOpacity(0.5)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => Register()),
                              ));
                        },
                        child: Text(
                          " Register",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
