import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todoapplication/screens/loginpage.dart';
import 'package:todoapplication/screens/settingsscreen.dart';
import 'package:todoapplication/util/constants.dart';
import 'package:todoapplication/widgets/Alertwidget.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _photo;
  String accountName = 'Martha Hays'; // Initial account name

  getimage({required ImageSource camera}) async {
    final ImagePicker picker = ImagePicker();
    final photo = await picker.pickImage(source: camera);
    if (photo != null) {
      setState(() {
        _photo = File(photo.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController mycontroller = TextEditingController();
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        title: Text(
          'Profile',
          style: TextStyle(color: ktextdColor, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: CircleAvatar(
                radius: 45,
                backgroundImage: _photo != null
                    ? FileImage(_photo!)
                    : AssetImage('asset/images/Mask group.png')
                        as ImageProvider,
              )),
              Center(
                child: Text(
                  accountName,
                  style: TextStyle(color: ktextdColor, fontSize: 17),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(color: Color(0xff363636)),
                    child: TextButton(
                      onPressed: null,
                      child: Text(
                        '10 Task left',
                        style: TextStyle(color: ktextdColor),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(color: Color(0xff363636)),
                    child: TextButton(
                      onPressed: null,
                      child: Text(
                        '5 Task Done',
                        style: TextStyle(color: ktextdColor),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Settings',
                style: TextStyle(color: ktextdColor, fontSize: 15),
              ),
              SizedBox(height: 10),
              buildSettingsRow(
                icon: Icons.settings,
                text: 'App settings',
                textcolor: Colors.white,
                onpress: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Settings()));
                },
              ),
              buildSettingsRow(
                icon: Icons.person_outline_outlined,
                text: 'Change account name',
                textcolor: Colors.white,
                onpress: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Alertwidget(
                        Buttontext2: 'Edit',
                        onclick: () {
                          setState(() {
                            accountName =
                                mycontroller.text; // Update accountName
                          });
                          Navigator.pop(
                              context); // Close the dialog after updating
                        },
                        title1: 'Change account name',

                        tftext: 'Enter new account name', // Placeholder text
                        Textfieldwidget: TextField(
                          controller: mycontroller,
                          decoration: InputDecoration(
                            hintText: 'Enter new account name',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kButtonColor),
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  );
                },
              ),
              buildSettingsRow(
                icon: Icons.key_rounded,
                text: 'Change account password',
                textcolor: Colors.white,
                onpress: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Alertwidget(
                        Textfieldwidget2: Text('Enter new password'),
                        Buttontext2: 'Edit',
                        title1: '  Change account password',
                        Textfieldwidget: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff363636),
                              border: Border.all(color: ktextdColor)),
                          child: TextField(
                            obscureText: true,
                          ),
                        ),
                        tftext: 'Enter old password',
                        tftext2: 'Enter new password',
                      );
                    },
                  );
                },
              ),
              buildSettingsRow(
                icon: Icons.image,
                text: 'Change account image',
                textcolor: Colors.white,
                onpress: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Color(0xff363636),
                    builder: (context) => Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xff363636),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Change account image',
                                style: TextStyle(
                                    color: ktextdColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          Divider(
                            color: ktextdColor,
                            indent: 20,
                            endIndent: 20,
                          ),
                          TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                                getimage(camera: ImageSource.camera);
                              },
                              child: Text(
                                'Take picture',
                                style:
                                    TextStyle(color: ktextdColor, fontSize: 16),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                                getimage(camera: ImageSource.gallery);
                              },
                              child: Text(
                                'Import from gallery',
                                style:
                                    TextStyle(color: ktextdColor, fontSize: 16),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.pop(context);
                              getimage(camera: ImageSource.camera);
                            },
                            child: Text(
                              'Import from google drive',
                              style:
                                  TextStyle(color: ktextdColor, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 15),
              Text(
                'Uptodo',
                style: TextStyle(color: ktextdColor, fontSize: 15),
              ),
              buildSettingsRow(
                icon: Icons.tab_unselected_outlined,
                text: 'About us',
                textcolor: Colors.white,
                onpress: () {},
              ),
              buildSettingsRow(
                icon: Icons.add_circle_outline_rounded,
                text: 'FAQ',
                textcolor: Colors.white,
                onpress: () {},
              ),
              buildSettingsRow(
                icon: Icons.add_circle_outline_rounded,
                text: 'Help & feedback',
                textcolor: Colors.white,
                onpress: () {},
              ),
              buildSettingsRow(
                icon: Icons.thumb_up_alt_outlined,
                text: 'Support us',
                textcolor: Colors.white,
                onpress: () {},
              ),
              buildSettingsRow(
                icon: Icons.logout,
                text: 'Logout',
                textcolor: Colors.red,
                onpress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Color(0xff363636),
                        child: Container(
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  ' are you sure want to logout ?',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Login(),
                                            ));
                                      },
                                      child: Text('submit')),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('cancel'))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSettingsRow(
      {required IconData icon,
      required String text,
      required Color textcolor,
      required VoidCallback onpress}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: textcolor, fontSize: 18),
            ),
          ),
          IconButton(
            onPressed: onpress,
            icon: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
