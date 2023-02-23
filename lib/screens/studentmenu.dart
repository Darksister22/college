import 'package:college/screens/dashboard.dart';
import 'package:college/components/text.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentMenu extends StatefulWidget {
  const StudentMenu({super.key});

  @override
  State<StudentMenu> createState() => _StudentMenuState();
}

class _StudentMenuState extends State<StudentMenu> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Dashboard(
      title: "معلومات الطلبة",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBox(height: 30.0),
              Row(
                children: [
                  mainSurface(context, "الرجاء اختيار المرحلة لعرض الطلبة"),
                  const Spacer(),
                  iconLabelButton(() {}, "طالب جديد", FontAwesomeIcons.plus),
                  sizedBox(width: 40.0)
                ],
              ),
              sizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonCard(
                      context,
                      width / 5.5,
                      height / 7,
                      const FaIcon(FontAwesomeIcons.one),
                      "المرحلة الاولى",
                      () {}),
                  buttonCard(
                      context,
                      width / 5.5,
                      height / 7,
                      const FaIcon(FontAwesomeIcons.two),
                      "المرحلة الثانية",
                      () {}),
                  buttonCard(
                      context,
                      width / 5.5,
                      height / 7,
                      const FaIcon(FontAwesomeIcons.three),
                      "المرحلة الثالثة",
                      () {}),
                ],
              ),
              sizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonCard(
                      context,
                      width / 5.5,
                      height / 7,
                      const FaIcon(FontAwesomeIcons.four),
                      "المرحلة الرابعة",
                      () {}),
                  buttonCard(
                      context,
                      width / 5.5,
                      height / 7,
                      const FaIcon(FontAwesomeIcons.five),
                      "المرحلة الخامسة",
                      () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
