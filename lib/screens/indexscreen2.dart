import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapplication/util/constants.dart';
import 'package:todoapplication/widgets/Dropdownwidget.dart';
import 'package:todoapplication/widgets/containerwidget.dart';
import 'package:todoapplication/widgets/textfieldwidget.dart';

class Indexdata extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;

  const Indexdata({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
            color: Colors.white,
          ),
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
            ),
          )
        ],
        title: Text(
          'Index',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Textfieldwidget(
              hinttext: 'Search for your task...',
              obscuretext: false,
              bgcolor: kbackgroundColor,
            ),
            SizedBox(
              height: 7,
            ),
            Dropdownwidget(
              icon: Icons.keyboard_arrow_down_sharp,
              text: 'Today',
            ),
            Flexible(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Column(
                    children: [
                      TodoContainerwidget(
                        text: task['title'],
                        time:
                            'Today At ${task['date'].hour}:${task['date'].minute}',
                        iconcolor: Colors.blueAccent,
                        icon: Icons.task_alt,
                        icontext: task['category'],
                        kcontainercolor: kButtonColor,
                        priority: null,
                      ),
                      SizedBox(height: 30),
                      Dropdownwidget(
                        icon: Icons.keyboard_arrow_down_sharp,
                        text: 'Completed',
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff363636),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Buy Grocery',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Today At 16:45',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
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
          ],
        ),
      ),
    );
  }
}
