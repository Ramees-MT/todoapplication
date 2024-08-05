import 'package:flutter/material.dart';
import 'package:todoapplication/controller/todo_controller.dart';
import 'package:todoapplication/screens/Categorypage.dart';
import 'package:todoapplication/util/constants.dart';
import 'package:todoapplication/widgets/custombuttonwidget.dart';

class Customgridview extends StatelessWidget {
  final Function(Map<String, dynamic>) onCategorySelected;

  Customgridview({
    super.key,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure "Create new" category is added last in the list
    List<Map<String, dynamic>> modifiedCategoryList = List.from(categoryList);
    modifiedCategoryList.sort((a, b) {
      if (a['categoryName'] == 'Create new') {
        return 1; // "Create new" should come after other categories
      } else if (b['categoryName'] == 'Create new') {
        return -1; // "Create new" should come after other categories
      } else {
        return 0;
      }
    });

    return Container(
      height: 600,
      width: 500,
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Choose Category',
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
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.9,
              ),
              itemCount: modifiedCategoryList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        // Set a fixed width for the container
                        decoration: BoxDecoration(
                          color: modifiedCategoryList[index]['color'],
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: IconButton(
                          icon: Icon(
                            modifiedCategoryList[index]['icon'],
                            color: Colors.white,
                            size: 40,
                          ),
                          onPressed: () {
                            if (modifiedCategoryList[index]['categoryName'] ==
                                'Create new') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Category(),
                                ),
                              );
                            } else {
                              onCategorySelected(modifiedCategoryList[index]);
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        modifiedCategoryList[index]['categoryName'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButtonWidget(
              name: 'Add Category',
              onpress: () {
                Navigator.pop((context));
              },
            ),
          ),
        ],
      ),
    );
  }
}
