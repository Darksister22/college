import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

SideBar sideBar = const SideBar(
  textStyle: TextStyle(color: Color(0xFF141B2C)),
  backgroundColor: Color(0xFFDBE2F9),
  items: [
    AdminMenuItem(
        title: "الصفحة الرئيسية", icon: FontAwesomeIcons.houseChimney),
    AdminMenuItem(title: "الطلبة الحاليين", icon: FontAwesomeIcons.users),
    AdminMenuItem(title: "التدريسيين", icon: FontAwesomeIcons.userTie),
    AdminMenuItem(title: "الكورس الدراسي الحالي", icon: FontAwesomeIcons.book),
    AdminMenuItem(title: "درجات الطلبة", icon: FontAwesomeIcons.calculator),
    AdminMenuItem(
        title: "الطلبة المتخرجن", icon: FontAwesomeIcons.graduationCap),
    AdminMenuItem(title: "ادارة الملفات", icon: FontAwesomeIcons.folder)
  ],
  selectedRoute: '/',
  footer: Text("Add a footer"),
);
