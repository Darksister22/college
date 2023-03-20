import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

SideBar sideBar(context, selectedRoute) {
  return SideBar(
    textStyle: const TextStyle(color: Color(0xFF141B2C)),
    activeTextStyle: const TextStyle(fontSize: 17),
    backgroundColor: const Color(0xFFDBE2F9),
    activeBackgroundColor: const Color(0xFFAEC6FF),
    items: const [
      AdminMenuItem(
          title: "الصفحة الرئيسية",
          icon: FontAwesomeIcons.houseChimney,
          route: '/home'),
      AdminMenuItem(
        title: "الطلبة الحاليين",
        icon: FontAwesomeIcons.users,
        route: '/studentmenu',
      ),
      AdminMenuItem(
          title: "التدريسيين",
          icon: FontAwesomeIcons.userTie,
          route: '/instructortable'),
      AdminMenuItem(title: "المراحل الدراسية", icon: FontAwesomeIcons.book)
    ],
    selectedRoute: selectedRoute,
    onSelected: (item) {
      Navigator.of(context).pushNamed(item.route!);
    },
  );
}
