import 'package:college/screens/coursetable.dart';
import 'package:college/screens/home.dart';
import 'package:college/screens/instructortable.dart';
import 'package:college/screens/levelmenu.dart';
import 'package:college/screens/login.dart';
import 'package:college/screens/studentmenu.dart';
import 'package:college/screens/studenttable.dart';
import 'package:college/screens/yearmenu.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments; //get the arguments passed in pushnamed
    switch (settings.name) {
      //the name sent from pushnamed
      case '/':
        return MaterialPageRoute(builder: (context) => const Login());
      case '/studentmenu':
        return MaterialPageRoute(builder: (context) => const StudentMenu());
      case '/levelmenu':
        return MaterialPageRoute(builder: (context) => const LevelMenu());
      case '/yearmenu':
        return MaterialPageRoute(builder: (context) => const YearMenu());
      case '/coursetable':
        return MaterialPageRoute(builder: (context) => const CourseTable());
      case '/instructortable':
        return MaterialPageRoute(builder: (context) => const InstructorTable());
      case '/studenttable':
        return MaterialPageRoute(
          builder: (context) => const StudentTable(),
        );
      case '/home':
        return MaterialPageRoute(builder: (context) => const Home());
      default:
        return MaterialPageRoute(builder: (context) => const Home());
    }
  }
}
