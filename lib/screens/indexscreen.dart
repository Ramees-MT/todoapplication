import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:todoapplication/Customgridview.dart';
import 'package:todoapplication/controller/todo_controller.dart';
import 'package:todoapplication/screens/calendar%20page.dart';
import 'package:todoapplication/util/constants.dart';
import 'package:todoapplication/widgets/containerwidget.dart';
import 'package:todoapplication/widgets/textfieldwidget.dart';
import 'calendar_page.dart';
import 'flagpage.dart';
import 'focusscreen.dart';
import 'profilepage.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  TextEditingController _taskcontroller = TextEditingController();
  DateTime _selectedDateTime = DateTime.now();
  Map<String, dynamic>? _selectedCategory;
  String? _selectedPriority;

  List<Widget> screens = [
    HomeScreen(tasks: todoList),
    Calender(),
    Focuspage(),
    Profile(),
  ];
  int selectedindex = 0;

  void getcategory(Map<String, dynamic> category) {
    print(category);
    _selectedCategory = category;
  }

  void getpriority(String priority) {
    print(priority);
    _selectedPriority = priority;
  }

  Future<void> _selectDate() async {
    await showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          height: 420, // Increase height to accommodate the button
          decoration: BoxDecoration(
              color: kButtonColor, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Expanded(
                child: CrCalendar(
                  firstDayOfWeek: WeekDay.sunday,
                  eventsTopPadding: 8,
                  backgroundColor: kButtonColor,
                  initialDate: DateTime.now(),
                  onDayClicked: (events, day) {
                    setState(() {
                      _selectedDateTime = day;
                    });
                  },
                  controller: CrCalendarController(),
                ),
              ),
              SizedBox(height: 8), // Space between calendar and button
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Confirm Date"),
                style: TextButton.styleFrom(
                  foregroundColor: kButtonColor,
                  backgroundColor: Colors.black, // Button background color
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 8), // Additional space at the bottom if needed
            ],
          ),
        ),
      ),
    ).then((value) => print(_selectedDateTime));
  }

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: kButtonColor,
              onPrimary: Colors.white,
              surface: kbackgroundColor,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: kbackgroundColor,
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      setState(() {
        if (_selectedDateTime != null) {
          _selectedDateTime = DateTime(
            _selectedDateTime!.year,
            _selectedDateTime!.month,
            _selectedDateTime!.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        } else {
          _selectedDateTime = DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            pickedTime.hour,
            pickedTime.minute,
          );
        }
        print("Selected Date and Time: $_selectedDateTime");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff363636),
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'index',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'focus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_off_outlined),
            label: 'profile',
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: const Color(0xff363636),
              isScrollControlled: true,
              builder: (context) => Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '  Add Task',
                        style: TextStyle(
                          color: ktextdColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Textfieldwidget(
                        controller: _taskcontroller,
                        hinttext: 'What to do',
                        obscuretext: false,
                        bgcolor: Color(0xff363636),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '  Description',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await _selectDate(); // First select the date
                            await _selectTime(); // Then select the time
                          },
                          icon: const Icon(
                            Icons.timer_outlined,
                            color: kiconColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor: Color(0xff363636),
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Customgridview(
                                      onCategorySelected: getcategory,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.sell_outlined,
                            color: kiconColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor: Color(0xff363636),
                                  child: Container(
                                    height: 470,
                                    margin: EdgeInsets.all(10),
                                    child: Custompriority(
                                      onPrioritySelected: getpriority,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.outlined_flag_sharp,
                            color: kiconColor,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            addTodo(
                              title: _taskcontroller.text,
                              date: _selectedDateTime,
                              category: _selectedCategory!,
                              priority: _selectedPriority!,
                            );

                            setState(() {
                              screens[0] = HomeScreen(
                                  tasks: todoList); // Update with tasks
                            });
                            _taskcontroller.clear();
                          },
                          icon: const Icon(
                            Icons.send_rounded,
                            color: Color.fromARGB(255, 76, 44, 205),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: kButtonColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
          ),
        ],
        title: const Text(
          'Index',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: selectedindex,
        children: screens,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;

  const HomeScreen({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (tasks.isEmpty) ...[
            const SizedBox(height: 100),
            Image.asset(
              'asset/images/index-removebg-preview (1).png',
              height: 250,
            ),
            const Center(
              child: Text(
                'What do you want to do today?',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Tap + to add tasks',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ] else ...[
            const SizedBox(height: 20),
            Textfieldwidget(
              hinttext: 'Search for your task...',
              obscuretext: false,
              bgcolor: kbackgroundColor,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  final DateTime taskDate = task['date'];
                  final String formattedDate =
                      "${taskDate.day}-${taskDate.month}-${taskDate.year}";
                  final String formattedTime =
                      "${taskDate.hour}:${taskDate.minute.toString().padLeft(2, '0')}";

                  return Column(
                    children: [
                      TodoContainerwidget(
                        index: index,
                        text: task['title'],
                        time: 'Date: $formattedDate,\n Time: $formattedTime',
                        iconcolor: task['category']['color'],
                        icon: task['category']['icon'],
                        icontext: task['category']['categoryName'],
                        kcontainercolor: kButtonColor,
                        priority: task['priority'],
                      ),
                      const SizedBox(height: 30),
                    ],
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
