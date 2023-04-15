import 'package:college/screens/menus/settingsmenu.dart';
import 'package:college/screens/tables/coursedegreetable.dart';
import 'package:college/screens/tables/coursetable.dart';
import 'package:college/screens/home.dart';
import 'package:college/screens/tables/instructortable.dart';
import 'package:college/screens/menus/levelmenu.dart';
import 'package:college/screens/login.dart';
import 'package:college/screens/menus/mastersheet.dart';
import 'package:college/screens/menus/studentmenu.dart';
import 'package:college/screens/tables/studenttable.dart';
import 'package:college/screens/menus/yearmenu.dart';
import 'package:college/screens/tables/userstable.dart';
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
      case '/coursedegreetable':
        return MaterialPageRoute(
            builder: (context) => CourseDegreeTable(data: args));
      case '/studenttable':
        return MaterialPageRoute(
            builder: (context) => StudentTable(year: args));
      case "/mastersheet":
        return MaterialPageRoute(
            builder: (context) => const MasterSheetTable());
      case "/settingsmenu":
        return MaterialPageRoute(builder: (context) => const SettingsMenu());
      case "/usertable":
        return MaterialPageRoute(
          builder: (context) => const UserTable(),
        );
      case '/home':
        return MaterialPageRoute(builder: (context) => const Home());
      default:
        return MaterialPageRoute(builder: (context) => const Home());
    }
  }
}
