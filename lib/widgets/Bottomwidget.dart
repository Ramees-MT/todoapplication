import 'package:flutter/material.dart';
import 'package:todoapplication/util/constants.dart';
import 'package:todoapplication/widgets/textfieldwidget.dart';

class Bottomwidget extends StatelessWidget {
  const Bottomwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff363636), // Change to desired color
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'index',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: 'calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), label: 'focus'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_off_outlined), label: 'profile'),
        ],
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Color(0xff363636),
              isScrollControlled: true,
              builder: (context) => Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '  Add Task',
                        style: TextStyle(
                            color: ktextdColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Textfieldwidget(
                          hinttext: 'What to do',
                          obscuretext: false,
                          bgcolor: Color(0xff363636),
                        )),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '  Description',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.timer_outlined,
                            color: kiconColor,
                          ),
                        ),
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.sell_outlined,
                            color: kiconColor,
                          ),
                        ),
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.outlined_flag_sharp,
                            color: kiconColor,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.send_rounded,
                              color: Color.fromARGB(255, 76, 44, 205),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            );
            // Add functionality for FAB here
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor:
              kButtonColor, // Change to your desired FAB background color
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // Positions FAB at the top left
    );
  }
}
