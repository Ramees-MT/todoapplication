import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapplication/controller/todo_controller.dart';
import 'package:todoapplication/util/constants.dart';
import 'package:todoapplication/widgets/Dropdownwidget.dart';
import 'package:todoapplication/widgets/bwsmallbuttonwidget.dart';
import 'package:todoapplication/widgets/colorwidget.dart';
import 'package:todoapplication/widgets/fwsmallbuttonwidget.dart';
import 'package:todoapplication/widgets/textfieldwidget.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  Color selectedColor = Colors.black; // Default selected color

  TextEditingController Categorycontroller = TextEditingController();
  IconData? selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        title: Text(
          'Create new category',
          style: TextStyle(
              color: ktextdColor, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '  Category name:',
                style: TextStyle(color: ktextdColor, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Textfieldwidget(
                controller: Categorycontroller,
                hinttext: 'Category name',
                obscuretext: false,
                bgcolor: Color(0xff363636),
              ),
              Text(
                '  Category icon:',
                style: TextStyle(color: ktextdColor, fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Dropdownwidget(
                text: 'Choose icon from library',
                icon: selectedIcon,
                onChanged: (value) {
                  setState(() {
                    selectedIcon = value;
                  });
                },
              ),
              Text(
                '  Category Color:',
                style: TextStyle(color: ktextdColor, fontSize: 15),
              ),
              SizedBox(
                height: 15,
              ),
              Categorycolor(
                onColorSelected: (color) {
                  setState(() {});
                  selectedColor = color;
                },
                selectedColor: selectedColor,
              ),
              SizedBox(
                height: 340,
                width: 130,
              ),
              Row(
                children: [
                  Bwsmall(
                    color: kbackgroundColor,
                    name: 'cancel',
                    tcolor: kButtonColor,
                    backpress: () {
                      Navigator.pop(context);
                    },
                  ),
                  Spacer(),
                  SmallButton(
                      name: 'Create category',
                      onpress: () {
                        if (selectedIcon != null) {
                          addCategory(
                              categoryName: Categorycontroller.text,
                              categoryIcon: selectedIcon!,
                              categoryColor: selectedColor);
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('please select an icon'),
                            ),
                          );
                        }
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
