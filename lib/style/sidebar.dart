import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

SideBar sideBar = const SideBar(
  textStyle: TextStyle(color: Color(0xFF141B2C)),
  backgroundColor: Color(0xFFDBE2F9),
  items: [
    AdminMenuItem(
      title: "الصفحة الرئيسية",
      icon: FontAwesomeIcons.houseChimney,
    ),
    AdminMenuItem(title: "الطلاب"),
    AdminMenuItem(title: "التدريسيين")
  ],
  selectedRoute: '/',
  footer: Text("Add a footer"),
);
