import 'package:flutter/material.dart';
import 'package:todoapplication/util/constants.dart';

class Alertwidget extends StatelessWidget {
  const Alertwidget({
    super.key,
    required this.title1,
    this.Textfieldwidget,
    required this.tftext,
    this.Textfieldwidget2,
    required this.Buttontext2,
    this.title2,
    this.onclick,
    this.tftext2,
    this.onNameChanged,
  });

  final String title1;
  final String tftext;
  final Widget? Textfieldwidget;
  final Widget? Textfieldwidget2;
  final String Buttontext2;
  final String? title2;
  final String? tftext2;
  final VoidCallback? onclick;
  final Function(String)? onNameChanged;

  @override
  Widget build(BuildContext context) {
    String newName = '';

    TextEditingController _controller = TextEditingController();
    return AlertDialog(
      backgroundColor: Color(0xff363636),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Center(
        child: Text(
          title1,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            color: Colors.white,
          ),
          Text(
            tftext,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          if (Textfieldwidget != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Textfieldwidget,
            ),
          SizedBox(
            height: 10,
          ),
          if (title2 != null) // Check if title2 is not null
            Center(
              child: Text(
                title2!,
                style: TextStyle(color: Colors.white),
              ),
            ),
          if (tftext2 != null) // Check if tftext2 is not null
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                tftext2!,
                style: TextStyle(color: Colors.white),
              ),
            ),
          if (Textfieldwidget2 != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: tftext),
              ),
            ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff363636)),
              ),
              child: Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
            Spacer(),
            SizedBox(width: 10),
            TextButton(
              onPressed: onclick,
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(kButtonColor),
              ),
              child: Text(
                Buttontext2,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
