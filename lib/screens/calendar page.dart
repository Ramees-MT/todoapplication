import 'package:flutter/material.dart';
import 'package:todoapplication/controller/todo_controller.dart';
import 'package:todoapplication/util/constants.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      _selectedIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Filtering tasks based on the selected date
    List<Map<String, dynamic>> selectedDayTasks = todoList
        .where((task) =>
            task['date'].day == _selectedDay.day &&
            task['date'].month == _selectedDay.month &&
            task['date'].year == _selectedDay.year)
        .toList();

    List<Map<String, dynamic>> completedTasks =
        selectedDayTasks.where((task) => task['isselected']).toList();

    List<Map<String, dynamic>> pendingTasks =
        selectedDayTasks.where((task) => !task['isselected']).toList();

    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        title: Text(
          'Calendar',
          style: TextStyle(color: ktextdColor, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WeeklyDatePicker(
            selectedDigitBorderColor: Colors.white,
            weeknumberTextColor: ktextdColor,
            weeknumberColor: const Color(0xff363636),
            selectedDigitBackgroundColor: kButtonColor,
            weekdayTextColor: ktextdColor,
            digitsColor: ktextdColor,
            selectedDigitColor: kButtonColor.withOpacity(0.2),
            backgroundColor: const Color(0xff363636),
            selectedDay: _selectedDay,
            changeDay: (value) => setState(() {
              _selectedDay = value;
            }),
          ),
          const SizedBox(height: 20),
          Container(
            height: 100,
            width: 350,
            decoration: BoxDecoration(
              color: const Color(0xff363636),
            ),
            child: TabBar(
              unselectedLabelColor: Colors.white,
              labelColor: Colors.white,
              controller: _tabController,
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: _selectedIndex == 0
                          ? kButtonColor
                          : const Color(0xff363636),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        'Today',
                        style: TextStyle(
                            color: _selectedIndex == 0
                                ? Colors.white
                                : Colors.white.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: _selectedIndex == 1
                          ? kButtonColor
                          : const Color(0xff363636),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        'Completed',
                        style: TextStyle(
                            color: _selectedIndex == 1
                                ? Colors.white
                                : Colors.white.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: pendingTasks.length,
                  itemBuilder: (context, index) {
                    final task = pendingTasks[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff363636),
                        ),
                        child: ListTile(
                          title: Text(
                            task['title'],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                          subtitle: Text(
                            '${_formatDate(task['date'])} at ${task['date'].hour}:${task['date'].minute.toString().padLeft(2, '0')}',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16,
                            ),
                          ),
                          leading: Icon(
                            task['category']['icon'],
                            color: task['category']['color'],
                          ),
                          trailing: Checkbox(
                            value: task['isselected'],
                            onChanged: (value) {
                              setState(() {
                                task['isselected'] = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: completedTasks.length,
                  itemBuilder: (context, index) {
                    final task = completedTasks[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff363636),
                        ),
                        child: ListTile(
                          title: Text(
                            task['title'],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                          subtitle: Text(
                            '${_formatDate(task['date'])} at ${task['date'].hour}:${task['date'].minute.toString().padLeft(2, '0')}',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16,
                            ),
                          ),
                          leading: Icon(
                            task['category']['icon'],
                            color: task['category']['color'],
                          ),
                          trailing: Checkbox(
                            value: task['isselected'],
                            onChanged: (value) {
                              setState(() {
                                task['isselected'] = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
