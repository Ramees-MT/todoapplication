import 'package:flutter/material.dart';
import 'package:todoapplication/util/constants.dart';

class Custompriority extends StatefulWidget {
  final Function(String) onPrioritySelected;
  Custompriority({
    super.key,
    required this.onPrioritySelected,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustompriorityState createState() => _CustompriorityState();
}

class _CustompriorityState extends State<Custompriority> {
  int? selectedPriority;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 500,
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Task priority',
            style: TextStyle(color: ktextdColor, fontSize: 16),
          ),
          Divider(
            color: Color.fromARGB(
              255,
              218,
              207,
              207,
            ), // Customize divider color if needed
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.6,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  int priority = index + 1;
                  bool isSelected = selectedPriority == priority;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 75,
                          decoration: BoxDecoration(
                            color:
                                isSelected ? kButtonColor : Color(0xff363636),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.flag_outlined,
                                  color:
                                      isSelected ? ktextdColor : Colors.white,
                                  size: 40,
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedPriority =
                                        isSelected ? null : priority;
                                  });
                                },
                              ),
                              Text(
                                '$priority',
                                style: TextStyle(
                                  color:
                                      isSelected ? ktextdColor : Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: kButtonColor),
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: kButtonColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (selectedPriority != null) {
                        widget.onPrioritySelected(selectedPriority.toString());
                      }
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(color: ktextdColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
