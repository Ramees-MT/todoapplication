import 'package:flutter/material.dart';
import 'package:todoapplication/controller/todo_controller.dart'; // Assuming todoList is defined here
import 'package:todoapplication/util/constants.dart';

class TodoContainerwidget extends StatefulWidget {
  const TodoContainerwidget({
    Key? key,
    required this.text,
    required this.time,
    this.iconcolor,
    this.icon,
    this.icontext,
    required this.kcontainercolor,
    required this.priority,
    this.index,
  }) : super(key: key);

  final String text;
  final String time;
  final Color? iconcolor;
  final IconData? icon;
  final String? icontext;
  final Color kcontainercolor;
  final String? priority;
  final int? index;

  @override
  State<TodoContainerwidget> createState() => _TodoContainerwidgetState();
}

class _TodoContainerwidgetState extends State<TodoContainerwidget> {
  bool isselected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff363636),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.text,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            widget.time,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 16),
                          ),
                          Spacer(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: null,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: widget.kcontainercolor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(widget.icon,
                                          color: widget.iconcolor),
                                      SizedBox(width: 5),
                                      Text(
                                        widget.icontext!,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              InkWell(
                                onTap: null,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Color(0xff363636),
                                    border: Border.all(color: kButtonColor),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.flag_outlined,
                                        color: Colors.blueAccent,
                                      ),
                                      Text(
                                        '${widget.priority}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
