import 'package:flutter/material.dart';
import 'package:todoapplication/util/constants.dart';
import 'package:todoapplication/widgets/Alertwidget.dart';
import 'package:todoapplication/widgets/Editwidget.dart';
import 'package:todoapplication/widgets/fwsmallbuttonwidget.dart';

class Edit extends StatelessWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
              child: Icon(
                Icons.find_replace_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Do Math Homework',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Do chapter 2 to 5 for next week',
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Editwidget(
                      icon: Icons.timer_outlined,
                      text: 'Task Time :',
                      time: 'Today at 16:45',
                    ),
                    SizedBox(height: 25),
                    Editwidget(
                      icon: Icons.sell_outlined,
                      text: 'Task Category :',
                      time: 'University',
                      icon2: Icons.school_outlined,
                    ),
                    SizedBox(height: 25),
                    Editwidget(
                      icon: Icons.flag_outlined,
                      text: 'Task priority :',
                      time: 'Default',
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Editwidget(
                      icon: Icons.task_alt_sharp,
                      text: 'Sub-Task :',
                      time: 'Add Sub-Task',
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.delete_outlined,
                          color: Colors.red,
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Alertwidget(
                                  Buttontext2: 'Delete',
                                  title1: 'Delete Task',
                                  tftext:
                                      'Are you sure want to delete this task',
                                  title2: 'Task title : Do math homework',
                                );
                              },
                            );
                          },
                          child: Text(
                            'Delete Task',
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 180,
                    ),
                    SmallButton(
                      name: 'Edit Task',
                      onpress: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Alertwidget(
                              title1: 'Edit Task title',
                              tftext: 'Do chapter 2 to 5 for next week',
                              Buttontext2: 'Edit',
                              Textfieldwidget: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Enter task title',
                                  hintStyle: TextStyle(color: Colors.white54),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                      color: Colors.white54,
                                    ),
                                  ),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.mode_edit_sharp,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
