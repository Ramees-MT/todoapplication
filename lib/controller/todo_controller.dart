import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<Map<String, dynamic>> todoList = [];

List<Map<String, dynamic>> categoryList = [
  {
    'categoryName': 'grocery',
    'icon': Icons.local_grocery_store_outlined,
    'color': Color(0xffCCFF80),
  },
  {
    'categoryName': 'Work',
    'icon': Icons.work_outline,
    'color': Color(0xffFF9680),
  },
  {
    'categoryName': 'Sport',
    'icon': Icons.fitness_center_rounded,
    'color': Color(0xff80FFFF),
  },
  {
    'categoryName': 'Design',
    'icon': Icons.interests,
    'color': Color(0xff80FFD9),
  },
  {
    'categoryName': 'University',
    'icon': Icons.school_outlined,
    'color': Color(0xff809CFF),
  },
  {
    'categoryName': 'Social',
    'icon': Icons.campaign_outlined,
    'color': Color(0xffFF80EB),
  },
  {
    'categoryName': 'Music',
    'icon': Icons.music_note_outlined,
    'color': Color(0xffFC80FF),
  },
  {
    'categoryName': 'Health',
    'icon': Icons.favorite_border_outlined,
    'color': Color(0xff80FFA3),
  },
  {
    'categoryName': 'Movie',
    'icon': Icons.videocam_outlined,
    'color': Color(0xff80D1FF),
  },
  {
    'categoryName': 'Home',
    'icon': Icons.home_filled,
    'color': Color(0xff80FFD1),
  },
  {
    'categoryName': 'Create new',
    'icon': Icons.add,
    'color': Color(0xffCCFF80),
  },
];

final List<IconData> categoryIcon = [
  Icons.shopping_cart,
  Icons.fitness_center,
  Icons.restaurant,
  Icons.local_cafe,
  Icons.flight,
  Icons.directions_car,
  Icons.pets,
  Icons.book,
  Icons.music_note,
  Icons.movie,
  Icons.beach_access,
  Icons.laptop,
];
final List<Color> categorycolor = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pinkAccent,
  Colors.pink,
  Colors.greenAccent,
  Colors.white,
];

void addTodo({
  required String title,
  required Map<String, dynamic> category,
  required String priority,
  required DateTime date,
}) {
  print(date);
  todoList.add({
    'title': title,
    'category': category,
    'priority': priority,
    'date': date,
    'isselected': false,
  });
  print(todoList);
}

void addCategory({
  required String categoryName,
  required IconData categoryIcon,
  required Color categoryColor,
}) {
  categoryList.add({
    'categoryName': categoryName,
    'icon': categoryIcon,
    'color': categoryColor
  });
  print(categoryList);
}
