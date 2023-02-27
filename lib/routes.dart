import 'package:college/screens/home.dart';
import 'package:college/screens/login.dart';
import 'package:college/screens/studentmenu.dart';
import 'package:college/screens/studenttable.dart';
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
