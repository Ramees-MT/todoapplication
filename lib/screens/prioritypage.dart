import 'package:flutter/material.dart';

void main() {
  runApp(TaskPriorityApp());
}

class TaskPriorityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edit Task Priority',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.purple,
        hintColor: Colors.purpleAccent,
      ),
      home: TaskPriorityScreen(),
    );
  }
}

class TaskPriorityScreen extends StatelessWidget {
  void _showEditTaskPriorityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return EditTaskPriorityDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Task Priority'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showEditTaskPriorityDialog(context),
          child: Text('Edit Task Priority'),
        ),
      ),
    );
  }
}

class EditTaskPriorityDialog extends StatefulWidget {
  @override
  _EditTaskPriorityDialogState createState() => _EditTaskPriorityDialogState();
}

class _EditTaskPriorityDialogState extends State<EditTaskPriorityDialog> {
  int? selectedPriority;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Task Priority'),
      content: Container(
        width: double.maxFinite,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1.0,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            int priority = index + 1;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedPriority = priority;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selectedPriority == priority ? Colors.purple : Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: Center(
                  child: Text(
                    '$priority',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Perform edit action with selectedPriority
            Navigator.of(context).pop();
          },
          child: Text('Edit'),
        ),
      ],
    );
  }
}