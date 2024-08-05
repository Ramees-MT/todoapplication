import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:todoapplication/util/constants.dart';
import 'package:todoapplication/widgets/custombuttonwidget.dart';
import 'package:fl_chart/fl_chart.dart';

class Focuspage extends StatefulWidget {
  const Focuspage({Key? key}) : super(key: key);

  @override
  _FocuspageState createState() => _FocuspageState();
}

class _FocuspageState extends State<Focuspage> {
  late final CountDownController _controller;
  int selectedDayIndex = 0; // Initially selecting the first day (Sunday)
  String _selectedOption = 'This Week'; // Default selected option

  // Example data for images and text
  final List<String> images = [
    'asset/images/instagram (1).png',
    'asset/images/Facebook.png',
    'asset/images/twitter.png',
    'asset/images/telegram.png',
    'asset/images/gmail.png',
  ];

  final List<String> titles = [
    'Instagram',
    'Facebook',
    'Twitter',
    'Telegram',
    'Gmail',
  ];

  final List<String> descriptions = [
    'You spent 4h on Instagram today',
    'You spent 3h on Facebook today',
    'You spent 2h on Twitter today',
    'You spent 1h on Telegram today',
    'You spent 0.5h on Gmail today',
  ];

  @override
  void initState() {
    super.initState();
    _controller = CountDownController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        title: Text(
          'Focus Mode',
          style: TextStyle(color: ktextdColor, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: CountDownProgressIndicator(
                timeTextStyle: TextStyle(
                  color: ktextdColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                controller: _controller,
                valueColor: kButtonColor,
                backgroundColor: Color(0xff363636),
                initialPosition: 0,
                duration: 100,
                text: 'SEC',
                onComplete: () => null,
              ),
            ),
          ),
          Center(
            child: Text(
              'While your focus mode is on, all of your',
              style: TextStyle(color: ktextdColor, fontSize: 16),
            ),
          ),
          Center(
            child: Text(
              'notification will be off',
              style: TextStyle(color: ktextdColor, fontSize: 16),
            ),
          ),
          Center(
            child: Container(
              height: 60,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: CustomButtonWidget(name: 'Start focusing', onpress: () {}),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Text(
                  'Overview',
                  style: TextStyle(color: ktextdColor, fontSize: 18),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff363636),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Color(0xff363636),
                      value: _selectedOption,
                      icon: Icon(Icons.arrow_drop_down, color: ktextdColor),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption = newValue!;
                          // Implement logic based on selected option
                        });
                      },
                      items: <String>[
                        'This Week',
                        'This Day',
                        'This Month',
                        'This Year',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: ktextdColor),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300, // Adjust the height of the BarChart
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                barGroups: _createSampleData(),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: SideTitles(showTitles: true),
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (context, value) => const TextStyle(
                      color: Color(0xff7589a2),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    margin: 20,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'Sun';
                        case 1:
                          return 'Mon';
                        case 2:
                          return 'Tue';
                        case 3:
                          return 'Wed';
                        case 4:
                          return 'Thu';
                        case 5:
                          return 'Fri';
                        case 6:
                          return 'Sat';
                        default:
                          return '';
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Applications',
              style: TextStyle(color: ktextdColor, fontSize: 22),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xff363636),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          images[index %
                              images.length], // Access image based on index
                          fit: BoxFit.contain,
                          height: 40,
                        ),
                        const SizedBox(
                          width: 8,
                        ), // Add spacing between image and text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                titles[index %
                                    titles
                                        .length], // Access title based on index
                                style:
                                    TextStyle(color: ktextdColor, fontSize: 13),
                                overflow:
                                    TextOverflow.ellipsis, // Handle overflow
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                descriptions[index %
                                    descriptions
                                        .length], // Access description based on index
                                style:
                                    TextStyle(color: ktextdColor, fontSize: 10),
                                overflow:
                                    TextOverflow.ellipsis, // Handle overflow
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.error_outline,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> _createSampleData() {
    final List<BarChartGroupData> data = [
      BarChartGroupData(x: 0, barRods: [
        _getBarChartRodData(0),
      ]),
      BarChartGroupData(x: 1, barRods: [
        _getBarChartRodData(1),
      ]),
      BarChartGroupData(x: 2, barRods: [
        _getBarChartRodData(2),
      ]),
      BarChartGroupData(x: 3, barRods: [
        _getBarChartRodData(3),
      ]),
      BarChartGroupData(x: 4, barRods: [
        _getBarChartRodData(4),
      ]),
      BarChartGroupData(x: 5, barRods: [
        _getBarChartRodData(5),
      ]),
      BarChartGroupData(x: 6, barRods: [
        _getBarChartRodData(6),
      ]),
    ];
    return data;
  }

  BarChartRodData _getBarChartRodData(int index) {
    final isSelected = index == selectedDayIndex;
    final color = isSelected ? kButtonColor : Color(0xff363636);
    return BarChartRodData(
      y: 50 * (index + 1).toDouble(),
      colors: [color],
      width: 24, // Adjust the width of the bar here
    );
  }
}
