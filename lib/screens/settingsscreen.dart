import 'package:flutter/material.dart';
import 'package:todoapplication/util/constants.dart';
import 'package:todoapplication/widgets/arrowwidget.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        title: Text(
          'Settings',
          style: TextStyle(color: ktextdColor, fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'settings',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildSettingsRow(
              icon: Icons.edit,
              textcolor: ktextdColor,
              text: 'change app color',
              onpress: () {}),
          SizedBox(
            height: 10,
          ),
          buildSettingsRow(
              icon: Icons.text_decrease_rounded,
              textcolor: ktextdColor,
              text: 'change app typography',
              onpress: () {}),
          buildSettingsRow(
              icon: Icons.text_decrease_rounded,
              textcolor: ktextdColor,
              text: 'change app language',
              onpress: () {}),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Import',
            style: TextStyle(color: ktextdColor),
          ),
          buildSettingsRow(
              icon: Icons.download,
              textcolor: ktextdColor,
              text: 'import from google calender',
              onpress: () {})
        ],
      ),
    );
  }
}
