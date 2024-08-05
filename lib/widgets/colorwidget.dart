import 'package:flutter/material.dart';
import 'package:todoapplication/controller/todo_controller.dart';

class Categorycolor extends StatelessWidget {
  final void Function(Color) onColorSelected;
  final Color? selectedColor;

  const Categorycolor({Key? key, required this.onColorSelected, this.selectedColor});

  @override
  Widget build(BuildContext context) {
    // List of colors to be used for the circle icons
    return SizedBox(
      height: 50, // Set a fixed height for the ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorycolor.length,
        itemBuilder: (context, index) {
          bool isSelected = categorycolor[index] == selectedColor;
          return GestureDetector(
            onTap: () {
              onColorSelected(categorycolor[index]);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: categorycolor[index],
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.transparent,
                        width: isSelected ? 2 : 0,
                      ),
                    ),
                    child: isSelected
                        ? Icon(
                            Icons.check,
                            color: Colors.blue,
                          )
                        : null,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
