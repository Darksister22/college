import 'package:college/API/dynamictable.dart';
import 'package:college/components/dialogues/studentdi.dart';
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
      selectedRoute: '/studentmenu',
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
                  iconLabelButton(() {
                    showDialog(
                        context: context, builder: (context) => AddStudent());
                  }, "طالب جديد", FontAwesomeIcons.plus),
                  sizedBox(width: 40.0)
                ],
              ),
              sizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonCard(context, width / 3, height / 7,
                      const FaIcon(FontAwesomeIcons.one), "المرحلة الاولى", () {
                    Navigator.pushNamed(context, '/studenttable');
                  }),
                  buttonCard(
                      context,
                      width / 3,
                      height / 7,
                      const FaIcon(FontAwesomeIcons.two),
                      "المرحلة الثانية", () {
                    Navigator.pushNamed(context, '/studenttable');
                  }),
                ],
              ),
              sizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonCard(
                      context,
                      width / 3,
                      height / 7,
                      const FaIcon(FontAwesomeIcons.three),
                      "المرحلة الثالثة", () {
                    Navigator.pushNamed(context, '/studenttable');
                  }),
                  buttonCard(
                      context,
                      width / 3,
                      height / 7,
                      const FaIcon(FontAwesomeIcons.four),
                      "المرحلة الرابعة", () {
                    Navigator.pushNamed(context, '/studenttable');
                  }),
                ],
              ),
              sizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonCard(
                      context,
                      width / 3,
                      height / 7,
                      const FaIcon(FontAwesomeIcons.book),
                      " الماجستير التحضيري", () {
                    Navigator.pushNamed(context, '/studenttable');
                  }),
                  buttonCard(
                      context,
                      width / 3,
                      height / 7,
                      const FaIcon(FontAwesomeIcons.graduationCap),
                      "الدكتوراة التحضيري", () {
                    Navigator.pushNamed(context, '/studenttable');
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

DataCell dataCell(text, {direction, color}) {
  return DataCell(rowText(text, direction: direction, color: color));
}

DataColumn dataColumn(text, context, {numeric = false}) {
  return DataColumn(label: colText(text, context), numeric: numeric);
}

Text rowText(text, {direction, color}) {
  return Text(
    text,
    textDirection: direction,
    style: TextStyle(fontSize: 20, color: color),
  );
}

Text colText(text, context) {
  return Text(
    text,
    style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 22),
  );
}
